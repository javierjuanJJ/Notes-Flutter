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

const userIdColumn = 'user_id';
const textColumn = 'text';
const isSyncedWithCloudIdColumn = false;
