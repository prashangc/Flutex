import 'package:flutex/config/route/routes.dart';
import 'package:flutex/features/analytics/presentation/ui/analytics_screen.dart';
import 'package:flutex/features/home/presentation/ui/home_screen.dart';
import 'package:flutex/features/login/presentation/ui/login_screen.dart';
import 'package:flutex/features/onboard/presentation/ui/onboard_screen.dart';
import 'package:flutex/features/register/presentation/ui/register_screen.dart';
import 'package:flutex/features/settings/presentation/ui/settings_screen.dart';
import 'package:flutex/features/splash/presentation/ui/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.home:
        final args = settings.arguments as HomeScreen;
        return MaterialPageRoute(
            builder: (_) =>
                HomeScreen(checkAuthTimeout: args.checkAuthTimeout));
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      case Routes.analytics:
        final args = settings.arguments as AnalyticsScreen;
        return MaterialPageRoute(
          builder: (_) => AnalyticsScreen(drawableModel: args.drawableModel),
        );
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
