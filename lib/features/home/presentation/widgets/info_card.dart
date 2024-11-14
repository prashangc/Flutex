import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutex/features/home/data/model/info_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class InfoCard extends StatelessWidget {
  final InfoModel info;
  final IconData icon;
  const InfoCard({
    super.key,
    required this.info,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.kLightGrey,
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            radius: 16.0,
            lineWidth: 2.0,
            animation: true,
            startAngle: 0.0,
            percent: double.parse(info.progress!),
            center: Icon(
              icon,
              size: 14.0,
            ),
            footer: Column(
              children: [
                sizedBox2(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: info.value!,
                      isBold: true,
                      fontSize: 16.0,
                    ),
                    sizedBox2(),
                    sizedBox2(),
                    sizedBox2(),
                    const CustomText(
                      text: "of",
                      isBold: true,
                    ),
                    sizedBox2(),
                    sizedBox2(),
                    sizedBox2(),
                    CustomText(
                      isBold: true,
                      text: info.total!,
                      color: AppColors.kGrey,
                    ),
                  ],
                ),
                sizedBox2(),
                CustomText(
                  isBold: true,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  text: info.title!,
                  fontSize: 10.0,
                  color: AppColors.kGrey,
                ),
              ],
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: AppColors.kBlack,
          ),
        ],
      ),
    );
  }
}
