import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/widgets/loading/custom_loading.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function callback;
  final String title;
  final double? width;
  final bool? isLoading;
  const CustomButton({
    super.key,
    required this.callback,
    this.isLoading,
    this.width,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          if (isLoading != true) {
            callback();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
        ),
        child: isLoading == true
            ? const CustomLoading()
            : CustomText(
                text: title,
                fontSize: 16.0,
                color: AppColors.kWhite,
              ),
      ),
    );
  }
}
