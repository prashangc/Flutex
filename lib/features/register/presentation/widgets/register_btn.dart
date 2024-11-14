import 'package:flutex/core/widgets/button/custom_button.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/features/register/domain/usecase/register_usecase.dart';
import 'package:flutter/material.dart';

class RegisterBtn extends StatelessWidget {
  final RegisterUsecase registerUsecase;
  const RegisterBtn({super.key, required this.registerUsecase});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: StreamBuilder(
          initialData: false,
          stream: registerUsecase.registerBtnLoading.stateStream,
          builder: (c, s) {
            return CustomButton(
              isLoading: s.data,
              width: maxWidth(context) / 1.5,
              callback: () {
                registerUsecase.registerBtnClick();
              },
              title: "Register",
            );
          }),
    );
  }
}
