import 'package:flutter/services.dart';

class CustomDeviceOrientation {
  static void disableLandscapeView() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
