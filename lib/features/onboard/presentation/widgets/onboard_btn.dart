import 'package:flutex/core/widgets/button/custom_button.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/features/onboard/domain/usecase/onboarding_usecase.dart';
import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardBtn extends StatelessWidget {
  final OnboardingUsecase onboardingUsecase;
  const OnboardBtn({super.key, required this.onboardingUsecase});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50.0),
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      width: maxWidth(context),
      child: StreamBuilder(
        initialData: 0,
        stream: onboardingUsecase.pageIndicatorBloc.stateStream,
        builder: (c, s) {
          return CustomButton(
            callback: () {
              if (s.data == onboardingUsecase.listOfOnboardingData.length - 1) {
                onboardingUsecase.getStarted();
              } else {
                onboardingUsecase.onSlideBtnClicked(index: s.data + 1);
              }
            },
            title: s.data == onboardingUsecase.listOfOnboardingData.length - 1
                ? "Get started"
                : "Next",
          );
        },
      ),
    );
  }
}
