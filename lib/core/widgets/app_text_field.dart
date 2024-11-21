import 'package:flutter/material.dart';
import 'package:weather_app_ajaya/core/constants/app_color.dart';
import 'package:weather_app_ajaya/core/widgets/app_text.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(String? value)? validator;

  final double fontSize;
  final double? titleFontSize;
  final FontWeight titleWeight;
  final String? label;
  final String? hint;
  final int maxLine;

  const AppTextField(
      {super.key,
      required this.controller,
      this.focusNode,
      this.validator,
      this.fontSize = 24,
      this.titleWeight = FontWeight.w500,
      this.titleFontSize,
      this.maxLine = 1,
      this.label,
      this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: (value) => validator?.call(value),
      decoration: InputDecoration(
          focusColor: AppColor.colorPrimary,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: AppColor.colorPrimary,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: AppColor.colorPrimary,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: AppColor.colorPrimary,
            ),
          ),
          label: AppTextRegular(text: label ?? ''),
          hintText: hint),
      maxLines: maxLine,
    );
  }
}
