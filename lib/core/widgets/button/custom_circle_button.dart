import 'package:flutex/config/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  final Function callback;
  final bool? isLoading;
  final IconData iconData;
  final Color? color;
  const CustomCircleButton({
    super.key,
    required this.callback,
    required this.iconData,
    this.color,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(),
      child: CircleAvatar(
        radius: 25.0,
        backgroundColor: color ?? AppColors.kPrimary,
        child: Icon(
          iconData,
          size: 24.0,
          color: AppColors.kWhite,
        ),
      ),
    );
  }
}
