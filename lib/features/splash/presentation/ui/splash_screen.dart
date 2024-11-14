import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/assets/assets.dart';
import 'package:flutex/core/injector/dependency_injection.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutex/features/splash/domain/usecase/splash_usecase.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final SplashUsecase splashUsecase = GetItServices.getIt<SplashUsecase>();
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadeInAnimation;
  Animation<Offset>? slideAnimation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController!, curve: Curves.easeIn),
    );
    slideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(
      CurvedAnimation(parent: animationController!, curve: Curves.easeInOut),
    );
    animationController!.forward();
    widget.splashUsecase.checkNavigation();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlack,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        width: maxWidth(context),
        height: maxHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: fadeInAnimation!,
              child: Image.asset(
                Assets.logo,
                width: maxWidth(context),
                height: maxHeight(context) / 3,
              ),
            ),
            SlideTransition(
              position: slideAnimation!,
              child: CustomText(
                text: "Welcome",
                isBold: true,
                fontSize: 20.0,
                color: AppColors.kWhite.withOpacity(0.3),
              ),
            )
          ],
        ),
      ),
    );
  }
}
