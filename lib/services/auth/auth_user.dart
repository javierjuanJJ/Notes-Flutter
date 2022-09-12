import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

@immutable
class AuthUser {
  final String id;
  final bool isEmailVerified;
  final String? email;

  const AuthUser(
      {required this.email,
      required this.isEmailVerified,
      required String this.id});

  factory AuthUser.fromFirebase(User user) => AuthUser(
      id: user.uid, isEmailVerified: user.emailVerified, email: user.email!);
}
