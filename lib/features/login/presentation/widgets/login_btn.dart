import 'package:flutex/core/widgets/button/custom_button.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/features/login/domain/usecase/login_usecase.dart';
import 'package:flutter/material.dart';

class LoginBtn extends StatelessWidget {
  final LoginUseCase loginUseCase;
  const LoginBtn({super.key, required this.loginUseCase});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: false,
      stream: loginUseCase.loginBtnLoading.stateStream,
      builder: (c, s) {
        return CustomButton(
          isLoading: s.data,
          width: maxWidth(context),
          callback: () {
            loginUseCase.onLoginBtnClick();
          },
          title: "Sign In",
        );
      },
    );
  }
}
