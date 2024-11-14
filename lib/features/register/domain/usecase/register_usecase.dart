import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutex/config/route/nav.dart';
import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/services/network/network_response.dart';
import 'package:flutex/core/services/state/state_handler_bloc.dart';
import 'package:flutex/core/utils/snackbar/custom_snackbar.dart';
import 'package:flutex/features/login/data/repository/login_repo.dart';
import 'package:flutter/material.dart';

class RegisterUsecase {
  final LoginRepo loginRepo;
  RegisterUsecase({required this.loginRepo});
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  List<GlobalKey<FormState>> formKeys = List.generate(
    4,
    (index) => GlobalKey<FormState>(),
  );
  StateHandlerBloc registerBtnLoading = StateHandlerBloc();

  // register validation
  bool registerValidation() {
    for (var element in formKeys) {
      if (!element.currentState!.validate()) {
        return false;
      }
    }
    if (password.text != confirmPassword.text) {
      return false;
    }
    return true;
  }

// match password
  String? doesPasswordMatches({required String v}) {
    if (v.length < 5) {
      return "Password should be atleast 6 characters";
    } else if (confirmPassword.text != password.text) {
      return "Password doesn't match";
    } else {
      return null;
    }
  }

  void registerBtnClick() async {
    bool isValid = registerValidation();
    if (isValid) {
      registerBtnLoading.storeData(data: true);
      bool isSuccess = await registerAccount();
      registerBtnLoading.storeData(data: false);
      if (isSuccess) {
        CustomSnackBar.showSnackBar(
          message: "Account successfully created",
          color: AppColors.kGreen,
        );
        Nav.pop();
      }
    }
  }

  // register api call
  Future<bool> registerAccount() async {
    DataResponse<User?> user = await loginRepo.registerUsingEmailPassword(
      name: username.text,
      email: email.text,
      password: password.text,
    );
    if (user.status == NetworkStatus.sucess) {
      return true;
    }
    return false;
  }
}
