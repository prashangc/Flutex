import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/assets/assets.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutex/features/home/domain/usecase/home_usecase.dart';
import 'package:flutter/material.dart';

class HomeDrawableProfile extends StatelessWidget {
  final HomeUsecase homeUsecase;
  const HomeDrawableProfile({super.key, required this.homeUsecase});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 41.0,
            backgroundColor: AppColors.kPrimary,
            child: CircleAvatar(
              radius: 40.0,
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
            children: [
              CustomText(
                text:
                    homeUsecase.capitalizeFirst(homeUsecase.user!.displayName!),
                isBold: true,
              ),
              sizedBox8(),
              CustomText(
                text: "View Profile",
                isBold: true,
                color: AppColors.kBlue,
              ),
            ],
          )
        ],
      ),
    );
  }
}
