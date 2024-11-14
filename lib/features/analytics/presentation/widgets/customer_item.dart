import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutex/features/analytics/domain/entities/analytics_model.dart';
import 'package:flutter/material.dart';

class CustomerItem extends StatelessWidget {
  final AnalyticsModel analytics;
  const CustomerItem({super.key, required this.analytics});

  @override
  Widget build(BuildContext context) {
    Color color =
        Colors.primaries[analytics.hashCode % Colors.primaries.length];

    return Container(
      width: maxWidth(context),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        boxShadow: [
          BoxShadow(
            color: AppColors.kLightGrey,
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.kPrimary.withOpacity(0.8),
            child: CustomText(
              text: analytics.title![0].toUpperCase(),
              color: AppColors.kWhite,
            ),
          ),
          sizedBox12(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: analytics.title!,
                  isBold: true,
                ),
                sizedBox2(),
                CustomText(
                  text: analytics.description!,
                  isBold: true,
                  color: AppColors.kBlue,
                ),
              ],
            ),
          ),
          sizedBox12(),
          Container(
            decoration: BoxDecoration(
              color: AppColors.kWhite,
              border: Border.all(
                color: color,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            padding: const EdgeInsets.all(6.0),
            child: CustomText(
              text: analytics.status!,
              fontSize: 10.0,
              isBold: true,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
