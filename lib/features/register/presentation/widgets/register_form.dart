import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/core/widgets/textform/custom_text_form_field.dart';
import 'package:flutex/features/register/domain/usecase/register_usecase.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  final RegisterUsecase registerUsecase;
  const RegisterForm({super.key, required this.registerUsecase});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          readOnly: false,
          textEditingController: registerUsecase.username,
          title: "Username",
          initialValue: "",
          errorMessage: "Enter your username",
          formKey: registerUsecase.formKeys[0],
        ),
        sizedBox16(),
        CustomTextFormField(
          readOnly: false,
          inputType: InputType.email,
          textEditingController: registerUsecase.email,
          title: "Email",
          initialValue: "",
          errorMessage: "Enter your email",
          formKey: registerUsecase.formKeys[1],
        ),
        sizedBox16(),
        CustomTextFormField(
          readOnly: false,
          inputType: InputType.password,
          textEditingController: registerUsecase.password,
          title: "Password",
          initialValue: "",
          errorMessage: "Enter your password",
          formKey: registerUsecase.formKeys[2],
          customValidation: ({required String v}) {
            return registerUsecase.doesPasswordMatches(v: v);
          },
          onValueChange: (String v) {
            registerUsecase.formKeys[3].currentState?.validate();
          },
        ),
        sizedBox16(),
        CustomTextFormField(
          readOnly: false,
          inputType: InputType.password,
          textEditingController: registerUsecase.confirmPassword,
          title: "Confirm Password",
          initialValue: "",
          errorMessage: "Confirm your password",
          formKey: registerUsecase.formKeys[3],
          onValueChange: (String v) {
            registerUsecase.formKeys[2].currentState?.validate();
          },
          customValidation: ({required String v}) {
            return registerUsecase.doesPasswordMatches(v: v);
          },
        ),
      ],
    );
  }
}
