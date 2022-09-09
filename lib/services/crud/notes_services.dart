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
