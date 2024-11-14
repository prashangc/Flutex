import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutex/core/services/network/network_response.dart';
import 'package:flutex/features/login/data/auth/login_auth_service.dart';
import 'package:flutex/features/login/data/repository/ilogin_repo.dart';

class LoginRepo implements LoginRepoInterface {
  final LoginAuthService loginAuthService;
  const LoginRepo({required this.loginAuthService});
  @override
  Future<DataResponse<User?>> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      User? user = await loginAuthService.registerUsingEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      if (user != null) {
        return DataResponse.completed(user);
      } else {
        return DataResponse.error("Something went wrong");
      }
    } catch (e) {
      return DataResponse.error(e.toString());
    }
  }

  @override
  Future<DataResponse<User?>> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      User? user = await loginAuthService.signInUsingEmailPassword(
        email: email,
        password: password,
      );
      if (user != null) {
        return DataResponse.completed(user);
      } else {
        return DataResponse.error("Something went wrong");
      }
    } catch (e) {
      return DataResponse.error(e.toString());
    }
  }
}
