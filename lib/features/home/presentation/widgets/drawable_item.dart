import 'package:flutex/config/route/nav.dart';
import 'package:flutex/config/route/routes.dart';
import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/services/firebase/firebase_helper.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutex/features/analytics/presentation/ui/analytics_screen.dart';
import 'package:flutex/features/home/domain/entities/drawable_model.dart';
import 'package:flutter/material.dart';

class DrawableItem extends StatelessWidget {
  final DrawableModel data;
  const DrawableItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (data.isLogout != true) {
          Nav.push(
            route: Routes.analytics,
            arguments: AnalyticsScreen(drawableModel: data),
          );
        } else {
          FirebaseQueryHelper.logout();
        }
      },
      trailing: Icon(
        Icons.keyboard_arrow_right_outlined,
        size: 14.0,
        color: data.isLogout == true ? AppColors.kTransparent : null,
      ),
      leading: Icon(
        data.iconData,
        size: 14.0,
        color: data.isLogout == true ? AppColors.kRed : null,
      ),
      title: CustomText(text: data.title),
    );
  }
}
