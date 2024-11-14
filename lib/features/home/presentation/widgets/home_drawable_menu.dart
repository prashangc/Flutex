import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/features/home/domain/usecase/home_usecase.dart';
import 'package:flutex/features/home/presentation/widgets/drawable_item.dart';
import 'package:flutex/features/home/presentation/widgets/drawable_profile.dart';
import 'package:flutter/material.dart';

class HomeDrawerMenu extends StatelessWidget {
  final HomeUsecase homeUsecase;
  const HomeDrawerMenu({super.key, required this.homeUsecase});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12.0),
          ),
          color: AppColors.kWhite,
        ),
        width: maxWidth(context) / 1.5,
        height: maxHeight(context),
        child: Column(
          children: [
            HomeDrawableProfile(homeUsecase: homeUsecase),
            const Divider(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: homeUsecase.listOfOnboardingData.length,
                itemBuilder: (ctx, i) => DrawableItem(
                  data: homeUsecase.listOfOnboardingData[i],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
