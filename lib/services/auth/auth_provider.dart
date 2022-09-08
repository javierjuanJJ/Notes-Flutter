import 'package:notes/services/auth/auth_user.dart';

abstract class AuthProvider {
  AuthUser? get currentUser;

  Future<AuthUser?> logIn({
    required String email,
    required String password,
  });

  Future<AuthUser?> createUser({
    required String email,
    required String password,
  });
  Future<AuthUser?> logOut();
  Future<AuthUser?> sendEmailVerification();
}