import 'package:flutex/config/theme/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final bool? isBold;
  final Color? color;
  final TextOverflow? textOverflow;
  final num? fontSize;
  final int? maxLines;
  final TextAlign? textAlign;
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.textOverflow,
    this.fontSize,
    this.maxLines,
    this.textAlign,
    this.isBold,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: textOverflow,
      textAlign: textAlign,
      style: TextStyle(
        color: color ?? AppColors.kBlack,
        fontSize: fontSize != null ? double.parse(fontSize.toString()) : 12.0,
        height: 1.5,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        fontWeight: isBold == true ? FontWeight.bold : FontWeight.w500,
      ),
    );
  }
}
