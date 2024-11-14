import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutex/features/home/data/model/invoice_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearProgressCard extends StatelessWidget {
  final InvoiceModel invoice;
  const LinearProgressCard({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sizedBox12(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: invoice.title!),
            CustomText(text: invoice.value!),
          ],
        ),
        sizedBox12(),
        LinearPercentIndicator(
          lineHeight: 8.0,
          percent: double.parse(invoice.progress!),
          barRadius: const Radius.circular(12.0),
          linearStrokeCap: LinearStrokeCap.roundAll,
          padding: EdgeInsets.zero,
          backgroundColor: AppColors.kLightGrey,
          progressColor:
              Colors.primaries[invoice.hashCode % Colors.primaries.length],
        ),
        sizedBox12(),
      ],
    );
  }
}
