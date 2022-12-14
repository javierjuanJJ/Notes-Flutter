import 'package:notes/services/auth/auth_provider.dart';
import 'package:notes/services/auth/auth_user.dart';
import 'package:notes/services/auth/firebase_auth_provider.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;

  const AuthService(this.provider);

  factory AuthService.firebase() => AuthService(FireBaseAuthProvider());

  @override
  Future<AuthUser?> createUser(
      {required String email, required String password}) {
    return provider.createUser(email: email, password: password);
  }

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser?> logIn({required String email, required String password}) {
    return provider.logIn(email: email, password: password);
  }

  @override
  Future<AuthUser?> logOut() {
    return provider.logOut();
  }

  @override
  Future<AuthUser?> sendEmailVerification() {
    return provider.sendEmailVerification();
  }

  @override
  Future<void> initialize() async {
    provider.initialize();
  }

  @override
  Future<void> sendPasswordReset({required String toEmail})  =>
      provider.sendPasswordReset(toEmail: toEmail);
}
