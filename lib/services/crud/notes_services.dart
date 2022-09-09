import 'package:flutter/cupertino.dart';

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

const idColumn = 'id';
const emailColumn = 'email';

@immutable
class DatabaseNote {
  final int id;
  final int user_id;
  final String text;

  DatabaseNote({required this.id, required this.user_id, required this.text});

  DatabaseNote.fromRaw(Map<String, Object?> map)
      : id = map[idColumn] as int,
        user_id = map[userIdColumn] as int,
        text = map[textColumn] as String;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseNote &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          user_id == other.user_id &&
          text == other.text;

  @override
  String toString() {
    return 'DatabaseNote{id: $id, user_id: $user_id, text: $text}';
  }
}
const userIdColumn = 'user_id';
const textColumn = 'text';
