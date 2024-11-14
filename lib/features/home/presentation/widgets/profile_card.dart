import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/assets/assets.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutex/features/home/domain/usecase/home_usecase.dart';
import 'package:flutter/material.dart';

class HomeProfileCard extends StatelessWidget {
  final HomeUsecase homeUsecase;
  const HomeProfileCard({super.key, required this.homeUsecase});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 35.0,
          backgroundColor: AppColors.kPrimary,
          child: CircleAvatar(
            radius: 34.0,
            backgroundColor: AppColors.kWhite,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                Assets.user,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        sizedBox16(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text:
                  "Welcome ${homeUsecase.capitalizeFirst(homeUsecase.user!.displayName!)}",
              isBold: true,
            ),
            sizedBox2(),
            CustomText(
              text: homeUsecase.user!.email!,
              isBold: true,
              fontSize: 10.0,
              color: AppColors.kGrey,
            ),
          ],
        )
      ],
    );
  }
}
