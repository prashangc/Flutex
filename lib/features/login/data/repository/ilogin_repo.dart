import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutex/core/services/network/network_response.dart';

abstract class LoginRepoInterface {
  Future<DataResponse<User?>> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<DataResponse<User?>> signInUsingEmailPassword({
    required String email,
    required String password,
  });
}
