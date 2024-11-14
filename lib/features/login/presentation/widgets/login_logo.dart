import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/assets/assets.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      width: maxWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox32(),
          sizedBox32(),
          Center(
            child: Image.asset(
              Assets.logo,
              color: AppColors.kWhite,
              width: maxWidth(context) / 2,
            ),
          ),
          sizedBox32(),
          CustomText(
            text: "Login",
            isBold: true,
            color: AppColors.kWhite,
            fontSize: 22.0,
          ),
          CustomText(
            text: "Login to you account",
            isBold: true,
            color: AppColors.kWhite,
          ),
          sizedBox24(),
        ],
      ),
    );
  }
}
