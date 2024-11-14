import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

class RegisterTitleCard extends StatelessWidget {
  const RegisterTitleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Create",
          fontSize: 24.0,
          isBold: true,
        ),
        CustomText(
          text: "An Account",
          fontSize: 20.0,
          isBold: true,
        ),
      ],
    );
  }
}
