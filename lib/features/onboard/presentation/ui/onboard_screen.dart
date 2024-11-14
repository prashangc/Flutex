import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/assets/assets.dart';
import 'package:flutex/core/injector/dependency_injection.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/features/onboard/domain/usecase/onboarding_usecase.dart';
import 'package:flutex/features/onboard/presentation/widgets/onboard_btn.dart';
import 'package:flutex/features/onboard/presentation/widgets/onboard_card.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingUsecase onboardingUsecase =
      GetItServices.getIt<OnboardingUsecase>();
  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      bottomNavigationBar: OnboardBtn(onboardingUsecase: onboardingUsecase),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        toolbarHeight: 0.0,
        backgroundColor: AppColors.kBackground,
      ),
      body: SizedBox(
        height: maxHeight(context),
        width: maxWidth(context),
        child: Column(
          children: [
            Image.asset(
              Assets.logo,
              width: maxWidth(context) / 2,
              height: maxHeight(context) / 6,
            ),
            Expanded(
              child: PageView.builder(
                controller: onboardingUsecase.pageController,
                onPageChanged: (i) {
                  onboardingUsecase.pageIndicatorBloc.storeData(data: i);
                },
                physics: const BouncingScrollPhysics(),
                itemCount: onboardingUsecase.listOfOnboardingData.length,
                itemBuilder: (ctx, i) {
                  return OnboardCard(
                      data: onboardingUsecase.listOfOnboardingData[i]);
                },
              ),
            ),
            SmoothPageIndicator(
              controller: onboardingUsecase.pageController,
              count: onboardingUsecase.listOfOnboardingData.length,
              effect: ExpandingDotsEffect(
                spacing: 10.0,
                radius: 3.0,
                dotWidth: 10.0,
                dotHeight: 6.0,
                strokeWidth: 1.5,
                dotColor: AppColors.kLightGrey,
                activeDotColor: AppColors.kPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
