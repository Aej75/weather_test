import 'package:flutter/material.dart';

import 'package:weather_app_ajaya/core/constants/app_color.dart';

class AppTextRegular extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final String? fontFamily;
  final double? letterSpacing;
  final double? wordSpacing;
  final bool isUnderlined;

  const AppTextRegular({
    super.key,
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight = FontWeight.w500,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.letterSpacing,
    this.wordSpacing,
    this.fontFamily,
    this.isUnderlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: textColor ?? AppColor.subtitleColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            fontFamily: fontFamily,
            decoration: isUnderlined ? TextDecoration.underline : null,
          ),
    );
  }
}
