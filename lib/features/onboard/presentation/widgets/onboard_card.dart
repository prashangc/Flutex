import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutex/features/onboard/domain/entities/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardCard extends StatelessWidget {
  final OnboardingModel data;
  const OnboardCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
      child: Column(
        children: [
          Expanded(child: Image.asset(data.image)),
          sizedBox24(),
          CustomText(
            text: data.title,
            isBold: true,
            fontSize: 16.0,
          ),
          sizedBox12(),
          CustomText(
            text: data.description,
            isBold: true,
            fontSize: 12.0,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
