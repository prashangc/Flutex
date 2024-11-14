import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static showSnackBar({
    required String message,
    Color? color,
  }) async {
    double statusBarHeight = MediaQueryData.fromView(window).padding.top;
    return BotToast.showCustomNotification(
      align: Alignment.topCenter,
      onlyOne: true,
      toastBuilder: (_) {
        return Container(
          padding: EdgeInsets.fromLTRB(
            12.0,
            statusBarHeight + 12.0,
            12.0,
            16.0,
          ),
          color: color ?? AppColors.kRed,
          width: double.infinity,
          child: CustomText(
            text: message,
            color: AppColors.kWhite,
          ),
        );
      },
      useSafeArea: false,
    );
  }
}
