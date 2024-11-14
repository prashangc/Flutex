import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/widgets/checkbox/custom_checkbox.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutex/features/login/domain/usecase/login_usecase.dart';
import 'package:flutter/material.dart';

class LoginRememberMe extends StatelessWidget {
  final LoginUseCase loginUseCase;
  const LoginRememberMe({super.key, required this.loginUseCase});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomCheckbox(
            initialValue: loginUseCase.isRemember,
            onValueChange: (v) => loginUseCase.storeRememberMeValue(value: v),
            title: "Remember me",
          ),
          CustomText(
            text: "Forgot Password?",
            isBold: true,
            color: AppColors.kBlue,
          )
        ],
      ),
    );
  }
}
