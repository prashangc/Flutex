import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutex/config/route/nav.dart';
import 'package:flutex/config/route/routes.dart';
import 'package:flutex/core/preference/shared_pref.dart';
import 'package:flutex/core/services/network/network_response.dart';
import 'package:flutex/core/services/state/state_handler_bloc.dart';
import 'package:flutex/features/home/presentation/ui/home_screen.dart';
import 'package:flutex/features/login/data/repository/login_repo.dart';
import 'package:flutter/material.dart';

class LoginUseCase {
  final LoginRepo loginRepo;
  LoginUseCase({required this.loginRepo});

  bool isRemember = false;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  List<GlobalKey<FormState>> formKeys = List.generate(
    2,
    (index) => GlobalKey<FormState>(),
  );
  StateHandlerBloc loginBtnLoading = StateHandlerBloc();

  // login validation
  bool loginValidation() {
    return formKeys[0].currentState?.validate() == true &&
        formKeys[1].currentState?.validate() == true;
  }

  // login button click
  void onLoginBtnClick() async {
    bool isValid = loginValidation();
    if (isValid) {
      loginBtnLoading.storeData(data: true);
      bool isSuccess = await postLogin();
      loginBtnLoading.storeData(data: false);
      if (isSuccess) {
        Nav.push(
          route: Routes.home,
          arguments: HomeScreen(checkAuthTimeout: null),
        );
      }
    }
  }

  // login api call
  Future<bool> postLogin() async {
    DataResponse<User?> user = await loginRepo.signInUsingEmailPassword(
      email: username.text,
      password: password.text,
    );
    if (user.status == NetworkStatus.sucess) {
      // store remember be bool to local data
      PreferenceHelper.storeBoolToDevice(
        tokenKey: "rememberMe",
        tokenValue: isRemember,
      );
      return true;
    }
    return false;
  }

  void storeRememberMeValue({required bool value}) {
    isRemember = value;
  }
}
