import 'package:flutex/config/route/nav.dart';
import 'package:flutex/config/route/routes.dart';
import 'package:flutex/core/preference/shared_pref.dart';
import 'package:flutex/features/home/presentation/ui/home_screen.dart';

class SplashUsecase {
  void checkNavigation() async {
    bool? hideOnboarding =
        PreferenceHelper.getBoolFromDevice(tokenKey: "hideOnboarding") ?? false;
    bool? isRemember =
        PreferenceHelper.getBoolFromDevice(tokenKey: "rememberMe") ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      if (hideOnboarding) {
        if (isRemember) {
          Nav.push(
            route: Routes.home,
            arguments: HomeScreen(checkAuthTimeout: true),
          );
        } else {
          Nav.push(route: Routes.login);
        }
      } else {
        Nav.push(route: Routes.onboarding);
      }
    });
  }
}
