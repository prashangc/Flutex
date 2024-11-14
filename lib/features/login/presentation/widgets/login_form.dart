import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/core/widgets/textform/custom_text_form_field.dart';
import 'package:flutex/features/login/domain/usecase/login_usecase.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final LoginUseCase loginUseCase;
  const LoginForm({super.key, required this.loginUseCase});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  void dispose() {
    widget.loginUseCase.username.dispose();
    widget.loginUseCase.password.dispose();
    for (var element in widget.loginUseCase.formKeys) {
      element.currentState!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          readOnly: false,
          textEditingController: widget.loginUseCase.username,
          title: "Email",
          initialValue: "",
          errorMessage: "Enter your email",
          formKey: widget.loginUseCase.formKeys[0],
        ),
        sizedBox16(),
        CustomTextFormField(
          readOnly: false,
          textEditingController: widget.loginUseCase.password,
          title: "Password",
          initialValue: "",
          inputType: InputType.password,
          errorMessage: "Enter your password",
          formKey: widget.loginUseCase.formKeys[1],
        ),
      ],
    );
  }
}
