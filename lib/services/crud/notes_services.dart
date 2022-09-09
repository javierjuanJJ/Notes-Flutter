import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:notes/services/crud/crud_exceptions.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

@immutable
class DatabaseUser {
  final int id;
  final String email;

  DatabaseUser({required this.id, required this.email});

  DatabaseUser.fromRaw(Map<String, Object?> map)
      : id = map[idColumn] as int,
        email = map[emailColumn] as String;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseUser &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email;

  @override
  String toString() {
    return 'DatabaseUser{id: $id, email: $email}';
  }
}

@immutable
class DatabaseNote {
  final int id;
  final int user_id;
  final String text;
  final bool is_synced_with_cloud;

  DatabaseNote(
      {required this.id,
      required this.user_id,
      required this.text,
      required this.is_synced_with_cloud});

  DatabaseNote.fromRaw(Map<String, Object?> map)
      : id = map[idColumn] as int,
        user_id = map[userIdColumn] as int,
        text = map[textColumn] as String,
        is_synced_with_cloud =
            map[isSyncedWithCloudIdColumn] as int == 1 ? true : false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseNote &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          user_id == other.user_id &&
          text == other.text &&
          is_synced_with_cloud == other.is_synced_with_cloud;

  @override
  String toString() {
    return 'DatabaseNote{id: $id, user_id: $user_id, text: $text, is_synced_with_cloud: $is_synced_with_cloud}';
  }
}

class NotesService {
  Database? _db;

  List<DatabaseNote> _notes = [];

  final _noteStreamController = StreamController<List<DatabaseNote>>.broadcast();

  Future<void> _cacheNotes() async {
    final allNotes = await getAllNotes();
    _notes = allNotes.toList();
    _noteStreamController.add(_notes);
  }

  Future<DatabaseNote> updateNote(
      {required DatabaseNote note, required String text}) async {
    final db = _getDatabaseOrThrow();
    await getNote(id: note.id);

    final updatesCount = await db
        .update(noteTable, {textColumn: text, isSyncedWithCloudIdColumn: 0});

    if (updatesCount == 0) {
      throw CouldNotUpdateNoteException();
    } else {
      final updateNote = await getNote(id: note.id);

      _notes.removeWhere((note) => updateNote.id == note.id);
      _notes.add(note);
      _noteStreamController.add(_notes);

      return updateNote;
    }
  }

  Future<Iterable<DatabaseNote>> getAllNotes() async {
    final db = _getDatabaseOrThrow();
    final createAccount = await db.query(noteTable);

    return createAccount.map((noteRow) => DatabaseNote.fromRaw(noteRow));
  }

  Future<DatabaseNote> getNote({required int id}) async {
    final db = _getDatabaseOrThrow();
    final createAccount = await db
        .query(noteTable, limit: 1, where: '$idColumn = ?', whereArgs: [id]);
    if (createAccount.isEmpty) {
      throw CoiuldNotFindNoteException();
    }
    else{
      final note = DatabaseNote.fromRaw(createAccount.first);
      _notes.removeWhere((note) => note.id == id);
      _notes.add(note);
      _noteStreamController.add(_notes);
      return note;
    }

  }

  Future<int> deleteAllNotes() async {
    final db = _getDatabaseOrThrow();

    final numberOfDeletions = await db.delete(noteTable);

    _notes = [];
    _noteStreamController.add(_notes);

    return numberOfDeletions;
  }

  Future<void> deleteNote({required int id}) async {
    final db = _getDatabaseOrThrow();
    final deleteAccount =
        await db.delete(noteTable, where: '$idColumn = ?', whereArgs: [id]);
    if (deleteAccount != 1) {
      throw CouldNotDeleteNoteException();
    }
    else{
      _notes.removeWhere((note) => note.id == id);
      _noteStreamController.add(_notes);
    }
  }

  Future<DatabaseNote> createNote({required DatabaseUser owner}) async {
    final db = _getDatabaseOrThrow();
    final dbUser = await getUser(email: owner.email);

    if (dbUser != owner) {
      throw CoiuldNotFindUserException();
    }

    const text = '';

    final noteId = await db.insert(noteTable, {
      userIdColumn: owner.id,
      textColumn: text,
      isSyncedWithCloudIdColumn: 1
    });

    final note = DatabaseNote(
        id: noteId, user_id: owner.id, text: text, is_synced_with_cloud: true);

    _notes.add(note);
    _noteStreamController.add(_notes);

    return note;
  }

  Future<DatabaseUser> getUser({required String email}) async {
    final db = _getDatabaseOrThrow();
    final createAccount = await db.query(userTable,
        limit: 1, where: '$emailColumn = ?', whereArgs: [email.toLowerCase()]);
    if (createAccount.isEmpty) {
      throw CoiuldNotFindUserException();
    }
    return DatabaseUser.fromRaw(createAccount.first);
  }

  Future<DatabaseUser> createUser({required String email}) async {
    final db = _getDatabaseOrThrow();
    final createAccount = await db.query(userTable,
        limit: 1, where: '$emailColumn = ?', whereArgs: [email.toLowerCase()]);
    if (createAccount.isNotEmpty) {
      throw UserAlreadysException();
    }
    final userId =
        await db.insert(userTable, {emailColumn: email.toLowerCase()});

    return DatabaseUser(id: userId, email: email);
  }

  Future<void> deleteUser({required String email}) async {
    final db = _getDatabaseOrThrow();
    final deleteAccount = db.delete(userTable,
        where: '$emailColumn = ?', whereArgs: [email.toLowerCase()]);
    if (deleteAccount != 1) {
      throw CouldNotDeleteUserException();
    }
  }

  Database _getDatabaseOrThrow() {
    final db = _db;

    if (db == null) {
      throw DatabaseIsNotOpenException();
    } else {
      return db;
    }
  }

  Future<void> close() async {
    final db = _db;

    if (db == null) {
      throw DatabaseIsNotOpenException();
    } else {
      await db.close();
    }
  }

  Future<void> open() async {
    if (_db != null) {
      throw DatabaseAlreadyOpenException();
    }

    try {
      final docsPath = await getApplicationDocumentsDirectory();
      final dbPath = join(docsPath.path, dbName);
      final db = await openDatabase(dbPath);

      _db = db;

      // create user column

      await db.execute(createUserTable);

      // create note column

      await db.execute(createNoteTable);
      await _cacheNotes();
    } on MissingPlatformDirectoryException {
      throw UnableToGetDocumentDirectoryException();
    }
  }
}

const createUserTable = ''' CREATE TABLE IF NOT EXISTS "$userTable" (
	"$idColumn"	INTEGER NOT NULL,
	"$emailColumn"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("$idColumn" AUTOINCREMENT)
); ''';

const createNoteTable = ''' CREATE TABLE IF NOT EXISTS "$noteTable" (
	"$idColumn"	INTEGER NOT NULL,
	"$userIdColumn"	INTEGER NOT NULL,
	"$textColumn"	TEXT,
	"$isSyncedWithCloudIdColumn"	INTEGER DEFAULT 0,
	PRIMARY KEY("$idColumn" AUTOINCREMENT),
	FOREIGN KEY("$userIdColumn") REFERENCES "$userTable"("$idColumn")
) ''';
const dbName = 'notes.db';
const noteTable = 'note';
const userTable = 'user';
const idColumn = 'id';
const emailColumn = 'email';
const userIdColumn = 'user_id';
const textColumn = 'text';
const String isSyncedWithCloudIdColumn = 'is_synced_with_cloud';
