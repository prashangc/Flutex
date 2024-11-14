import 'package:flutex/config/theme/colors.dart';
import 'package:flutter/material.dart';

class AddAnalytics extends StatelessWidget {
  const AddAnalytics({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      mini: true,
      backgroundColor: AppColors.kPrimary,
      shape: const CircleBorder(),
      child: Icon(
        Icons.add,
        color: AppColors.kWhite,
      ),
    );
  }
}
