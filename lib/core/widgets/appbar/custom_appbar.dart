import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: AppColors.kWhite),
      backgroundColor: AppColors.kPrimary,
      title: CustomText(
        text: title,
        color: AppColors.kWhite,
        fontSize: 14.0,
        isBold: true,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
