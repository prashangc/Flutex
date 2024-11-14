import 'dart:io';
import 'dart:math';

import 'package:flutter/widgets.dart';

extension ContextExt on BuildContext {
  bool get isPhone => MediaQuery.of(this).size.shortestSide < 600.0;
  bool get isTablet => MediaQuery.of(this).size.shortestSide >= 600.0;
  bool get isIpad =>
      Platform.isIOS && MediaQuery.of(this).size.shortestSide >= 600.0;
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }

  static double calculateFontSize(BuildContext context,
      {required double baseFontSize, required double maxTextFontSize}) {
    // Get the textScaleFactor width
    final tsf = MediaQuery.of(context).textScaleFactor;
    log(tsf);

    // Calculate the font size based on screen width
    double fontSize = baseFontSize * tsf;
    fontSize = fontSize.clamp(baseFontSize, maxTextFontSize);
    // Ensure the font size does not exceed the maximum value
    return fontSize;
  }
}
