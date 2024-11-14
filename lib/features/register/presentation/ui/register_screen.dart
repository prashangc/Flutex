import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/injector/dependency_injection.dart';
import 'package:flutex/core/utils/focus/focus_remover.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/features/register/domain/usecase/register_usecase.dart';
import 'package:flutex/features/register/presentation/widgets/register_btn.dart';
import 'package:flutex/features/register/presentation/widgets/register_form.dart';
import 'package:flutex/features/register/presentation/widgets/register_title_card.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterUsecase registerUsecase =
      GetItServices.getIt<RegisterUsecase>();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.kBackground,
      ),
      body: GestureDetector(
        onTap: () => CustomFocusRemover.removeFocus(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RegisterTitleCard(),
              sizedBox16(),
              RegisterForm(registerUsecase: registerUsecase),
              sizedBox16(),
              RegisterBtn(registerUsecase: registerUsecase),
              sizedBox32(),
            ],
          ),
        ),
      ),
    );
  }
}
