import 'package:flutex/features/analytics/domain/usecase/analytic_usecase.dart';
import 'package:flutex/features/home/domain/usecase/home_usecase.dart';
import 'package:flutex/features/login/data/auth/login_auth_service.dart';
import 'package:flutex/features/login/data/repository/login_repo.dart';
import 'package:flutex/features/login/domain/usecase/login_usecase.dart';
import 'package:flutex/features/onboard/domain/usecase/onboarding_usecase.dart';
import 'package:flutex/features/register/domain/usecase/register_usecase.dart';
import 'package:flutex/features/splash/domain/usecase/splash_usecase.dart';
import 'package:get_it/get_it.dart';

class GetItServices {
  static final getIt = GetIt.instance;

  static Future<void> serviceLocator() async {
    getIt.registerFactory(() => SplashUsecase());
    getIt.registerFactory(() => OnboardingUsecase());
    getIt.registerFactory(() => LoginAuthService());
    getIt.registerFactory(() => HomeUsecase());
    getIt.registerFactory(() => AnalyticUsecase());
    getIt.registerFactory(
        () => LoginRepo(loginAuthService: getIt<LoginAuthService>()));
    getIt.registerFactory(() => RegisterUsecase(loginRepo: getIt<LoginRepo>()));
    getIt.registerFactory(() => LoginUseCase(loginRepo: getIt<LoginRepo>()));
  }
}
