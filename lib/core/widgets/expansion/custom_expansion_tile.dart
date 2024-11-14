import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final bool initiallyExpanded;
  final GlobalKey? globalKey;
  final Widget child;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.initiallyExpanded,
    this.globalKey,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: AppColors.kPrimary,
        primaryColor: AppColors.kPrimary,
        dividerColor: Colors.transparent,
      ),
      child: ListTileTheme(
        dense: true,
        horizontalTitleGap: 0.0,
        minLeadingWidth: 0,
        child: ExpansionTile(
          key: globalKey,
          onExpansionChanged: (v) {},
          backgroundColor: AppColors.kBackground,
          initiallyExpanded: initiallyExpanded,
          maintainState: true,
          title: Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Row(
              children: [
                Container(
                  width: 4.0,
                  height: 15.0,
                  color: AppColors.kBlue,
                ),
                sizedBox8(),
                CustomText(
                  text: title,
                  isBold: true,
                ),
              ],
            ),
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
