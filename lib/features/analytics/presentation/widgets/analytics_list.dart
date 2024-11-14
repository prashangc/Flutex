import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutex/features/analytics/domain/entities/analytics_model.dart';
import 'package:flutex/features/analytics/presentation/widgets/customer_item.dart';
import 'package:flutex/features/home/domain/entities/drawable_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AnalyticsList extends StatelessWidget {
  final DrawableModel drawableModel;
  final List<AnalyticsModel> analyticsList;
  const AnalyticsList({
    super.key,
    required this.drawableModel,
    required this.analyticsList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: maxWidth(context),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          sizedBox16(),
          AnalyticTitleCard(drawableModel: drawableModel),
          sizedBox16(),
          ListView.builder(
            itemCount: analyticsList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, i) {
              return analyticsList[i].isCustomer == true
                  ? CustomerItem(analytics: analyticsList[i])
                  : AnalyticItem(analytics: analyticsList[i]);
            },
          ),
        ],
      ),
    );
  }
}

class AnalyticTitleCard extends StatelessWidget {
  final DrawableModel drawableModel;
  const AnalyticTitleCard({
    super.key,
    required this.drawableModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: drawableModel.title,
          isBold: true,
        ),
        Row(
          children: [
            Icon(
              Icons.sort_outlined,
              size: 16.0,
              color: AppColors.kGrey,
            ),
            sizedBox8(),
            CustomText(
              text: "Filter",
              color: AppColors.kGrey,
            ),
          ],
        ),
      ],
    );
  }
}

class AnalyticItem extends StatelessWidget {
  final AnalyticsModel analytics;
  const AnalyticItem({super.key, required this.analytics});

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
      child: Row(
        children: [
          Container(
            width: 4.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                topLeft: Radius.circular(8.0),
              ),
            ),
          ),
          sizedBox12(),
          Expanded(
            child: Column(
              children: [
                DataRow(
                  isBold: true,
                  leadingText: analytics.title,
                  trailingText: analytics.amount,
                ),
                sizedBox2(),
                if (analytics.description != null)
                  DataRow(
                    fontSize: 10.0,
                    leadingText: analytics.description,
                    trailingText: analytics.showProgressBar == true
                        ? "${analytics.name} %"
                        : analytics.name,
                  ),
                analytics.showProgressBar == true
                    ? Column(
                        children: [
                          sizedBox8(),
                          LinearPercentIndicator(
                            lineHeight: 8.0,
                            percent: double.parse(analytics.name!) / 100,
                            barRadius: const Radius.circular(12.0),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            backgroundColor: AppColors.kLightGrey,
                            progressColor: color,
                            padding: EdgeInsets.zero,
                          ),
                          sizedBox8(),
                        ],
                      )
                    : Divider(color: AppColors.kLightGrey.withOpacity(0.3)),
                DataRow(
                  showIcon: true,
                  color: AppColors.kGrey,
                  trailingText:
                      "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                  leadingText: analytics.status ?? analytics.name,
                ),
              ],
            ),
          ),
          sizedBox12(),
        ],
      ),
    );
  }
}

class DataRow extends StatelessWidget {
  final double? fontSize;
  final String? leadingText;
  final String? trailingText;
  final bool? showIcon;
  final Color? color;
  final bool? isBold;
  const DataRow({
    super.key,
    this.fontSize,
    required this.trailingText,
    required this.leadingText,
    this.color,
    this.isBold,
    this.showIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              if (showIcon == true) ...{
                Icon(
                  Icons.check_circle_outline,
                  color: leadingText == "Unpaid"
                      ? AppColors.kRed
                      : AppColors.kBlue,
                  size: 12.0,
                ),
                sizedBox2(),
                sizedBox2(),
              },
              Expanded(
                child: CustomText(
                  textOverflow: TextOverflow.ellipsis,
                  color: color,
                  text: leadingText ?? "",
                  isBold: isBold,
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ),
        sizedBox12(),
        Row(
          children: [
            if (showIcon == true) ...{
              Icon(
                Icons.date_range_outlined,
                color: AppColors.kBlue,
                size: 12.0,
              ),
              sizedBox2(),
              sizedBox2(),
            },
            CustomText(
              text: trailingText ?? "",
              isBold: isBold,
              fontSize: fontSize,
            ),
          ],
        ),
      ],
    );
  }
}
