import 'package:flutex/config/route/nav.dart';
import 'package:flutex/config/route/routes.dart';
import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/assets/assets.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback callback;
  const HomeAppbar({super.key, required this.callback});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kPrimary,
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: () => callback(),
        child: Icon(
          Icons.menu,
          color: AppColors.kWhite,
          size: 24.0,
        ),
      ),
      centerTitle: true,
      title: Image.asset(
        Assets.logo,
        width: maxWidth(context) / 2,
        height: kToolbarHeight / 2,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: GestureDetector(
            onTap: () => Nav.push(route: Routes.settings),
            child: Icon(
              Icons.settings,
              color: AppColors.kWhite,
              size: 24.0,
            ),
          ),
        )
      ],
    );
  }
}
