import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback myTap;
  final bool showDivider;
  final Widget? action;

  const SettingsItem({
    super.key,
    required this.title,
    required this.icon,
    required this.myTap,
    this.showDivider = true,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      width: maxWidth(context),
      margin: EdgeInsets.only(
          bottom: showDivider == false ? 0.0 : 8.0,
          top: action != null ? 0.0 : 8.0),
      child: GestureDetector(
        onTap: myTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        size: 16.0,
                      ),
                      sizedBox24(),
                      Expanded(
                        child: CustomText(
                          text: title,
                        ),
                      ),
                      action ??
                          const Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Icon(
                              Icons.keyboard_arrow_right_outlined,
                              size: 24.0,
                            ),
                          ),
                    ],
                  ),
                  sizedBox24(),
                  Container(
                    color: AppColors.kLightGrey,
                    height: showDivider ? 1.0 : 0.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
