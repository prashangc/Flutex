import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/widgets/expansion/custom_expansion_tile.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutex/features/analytics/domain/entities/summary_model.dart';
import 'package:flutex/features/home/domain/entities/drawable_model.dart';
import 'package:flutter/material.dart';

class AnalyticSummary extends StatelessWidget {
  final DrawableModel drawableModel;
  final List<SummaryModel> summaryList;
  const AnalyticSummary({
    super.key,
    required this.drawableModel,
    required this.summaryList,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: summaryList.isNotEmpty,
      child: Column(
        children: [
          CustomExpansionTile(
            title: "${drawableModel.title} Summary",
            initiallyExpanded: true,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              height: 80.0,
              width: maxWidth(context),
              child: ListView.builder(
                itemCount: summaryList.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) {
                  return SummaryCard(summary: summaryList[i]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final SummaryModel summary;
  const SummaryCard({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      margin: const EdgeInsets.only(right: 12.0),
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
          Radius.circular(12.0),
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: summary.count.toString(),
            color: AppColors.kBlue,
            fontSize: 18.0,
            isBold: true,
          ),
          sizedBox2(),
          CustomText(
            textAlign: TextAlign.center,
            text: summary.title!,
            isBold: true,
            fontSize: 10.0,
          ),
        ],
      ),
    );
  }
}
