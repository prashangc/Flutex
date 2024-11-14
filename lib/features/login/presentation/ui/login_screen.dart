import 'package:flutex/config/route/nav.dart';
import 'package:flutex/config/route/routes.dart';
import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/injector/dependency_injection.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutex/features/login/domain/usecase/login_usecase.dart';
import 'package:flutex/features/login/presentation/widgets/login_btn.dart';
import 'package:flutex/features/login/presentation/widgets/login_form.dart';
import 'package:flutex/features/login/presentation/widgets/login_logo.dart';
import 'package:flutex/features/login/presentation/widgets/login_remember_me.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final LoginUseCase loginUseCase = GetItServices.getIt<LoginUseCase>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimary,
      body: SizedBox(
        width: maxWidth(context),
        height: maxHeight(context),
        child: Column(
          children: [
            const LoginLogo(),
            LoginBody(loginUseCase: loginUseCase),
          ],
        ),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({super.key, required this.loginUseCase});
  final LoginUseCase loginUseCase;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
          child: Column(
            children: [
              LoginForm(loginUseCase: loginUseCase),
              LoginRememberMe(loginUseCase: loginUseCase),
              sizedBox8(),
              LoginBtn(loginUseCase: loginUseCase),
              sizedBox16(),
              GestureDetector(
                onTap: () => Nav.push(route: Routes.register),
                child: const CustomText(
                  text: "Register",
                  isBold: true,
                ),
              ),
              sizedBox32(),
            ],
          ),
        ),
      ),
    );
  }
}
