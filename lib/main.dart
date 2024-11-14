import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutex/config/route/nav.dart';
import 'package:flutex/config/route/route_generator.dart';
import 'package:flutex/config/route/routes.dart';
import 'package:flutex/core/injector/dependency_injection.dart';
import 'package:flutex/core/orientation/device_orientation.dart';
import 'package:flutex/core/preference/shared_pref.dart';
import 'package:flutex/core/services/database/isar_setup.dart';
import 'package:flutex/core/utils/internet/internet_conn.dart';
import 'package:flutex/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  IsarSetup.initializeIsarDb();
  CustomDeviceOrientation.disableLandscapeView();
  await GetItServices.serviceLocator();
  await PreferenceHelper.init();
  await CheckInternetConnection.listenInternetState(performTask: () {});
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(useMaterial3: false),
      child: MaterialApp(
        navigatorKey: Nav.navKey,
        builder: (context, child) {
          child = BotToastInit()(context, child);
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child,
          );
        },
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.root,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
