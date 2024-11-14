import 'package:flutex/config/route/nav.dart';
import 'package:flutex/config/route/routes.dart';
import 'package:flutex/core/assets/assets.dart';
import 'package:flutex/core/preference/shared_pref.dart';
import 'package:flutex/core/services/state/state_handler_bloc.dart';
import 'package:flutex/features/onboard/domain/entities/on_boarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingUsecase {
  final PageController pageController = PageController(initialPage: 0);
  final StateHandlerBloc pageIndicatorBloc = StateHandlerBloc();
  final List<OnboardingModel> listOfOnboardingData = [
    const OnboardingModel(
      title: "Track Your Calories",
      description:
          "Easily log your meals and track your daily calorie intake to stay on top of your nutrition goals.",
      image: Assets.onboarding1,
    ),
    const OnboardingModel(
      title: "Monitor Macronutrients",
      description:
          "Keep track of your protein, carbs, and fats to ensure a balanced diet for a healthy lifestyle.",
      image: Assets.onboarding2,
    ),
    const OnboardingModel(
      title: "Find Healthy Recipes",
      description:
          "Explore a variety of nutritious recipes tailored to your dietary preferences and needs.",
      image: Assets.onboarding3,
    ),
  ];

  void getStarted() {
    PreferenceHelper.storeBoolToDevice(
      tokenKey: "hideOnboarding",
      tokenValue: true,
    );
    Nav.push(route: Routes.login);
  }

  void onSlideBtnClicked({required int index}) {
    pageController.jumpToPage(index);
  }
}
