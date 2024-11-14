import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginAuthServiceInterface {
  Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
  });
}
