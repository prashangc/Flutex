import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/services/firebase/firebase_helper.dart';
import 'package:flutex/core/widgets/appbar/custom_appbar.dart';
import 'package:flutex/features/settings/presentation/widgets/settings_item.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: "Settings"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kLightGrey,
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
                color: AppColors.kWhite,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              child: Column(
                children: [
                  SettingsItem(
                    title: "Profile",
                    icon: Icons.perm_identity_outlined,
                    myTap: () {},
                  ),
                  SettingsItem(
                    title: "Language",
                    icon: Icons.language_outlined,
                    myTap: () {},
                  ),
                  SettingsItem(
                    title: "Dark Mode",
                    icon: Icons.dark_mode_outlined,
                    myTap: () {},
                    action: Switch(
                      value: false,
                      onChanged: (v) {},
                      activeColor: AppColors.kPrimary,
                      inactiveThumbColor: AppColors.kPrimary,
                      inactiveTrackColor: AppColors.kBackground,
                      activeTrackColor: AppColors.kBackground,
                    ),
                  ),
                  SettingsItem(
                    title: "Privacy & Policy",
                    icon: Icons.privacy_tip_outlined,
                    myTap: () {},
                  ),
                  SettingsItem(
                    title: "Logout",
                    icon: Icons.logout_outlined,
                    myTap: () {
                      FirebaseQueryHelper.logout();
                    },
                    showDivider: false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
