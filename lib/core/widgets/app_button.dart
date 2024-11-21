import 'package:flutter/material.dart';
import 'package:weather_app_ajaya/core/constants/app_color.dart';

enum ButtonType { filled }

class AppButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String? text;
  final double height;
  final Widget? child;
  final double? elevation;
  const AppButton(
      {super.key,
      required this.onpressed,
      this.text,
      this.height = 50,
      this.child,
      this.elevation});

  static Widget outlined(
      {required BuildContext context,
      required final VoidCallback onpressed,
      final String? text,
      final EdgeInsetsGeometry? padding,
      final double? height,
      final Color backgroundColor = Colors.black12,
      final Color foreGroundColor = AppColor.textColor4,
      final Widget? child}) {
    return SizedBox(
      height: height ?? 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: padding,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          shadowColor: const Color(0xffb9d8a0),
          backgroundColor: backgroundColor,
          foregroundColor: foreGroundColor,
        ),
        onPressed: onpressed,
        child: child ?? Text(text ?? ''),
      ),
    );
  }

  static Widget filled(
      {required BuildContext context,
      required final VoidCallback onpressed,
      final EdgeInsetsGeometry? padding,
      final String? text,
      final double? height,
      final double? width,
      final double? elevation = 0,
      final Color backgroundColor = AppColor.colorPrimary,
      final Color foreGroundColor = Colors.white,
      final Widget? child,
      final bool enableFixedHeight = true}) {
    return SizedBox(
      height: height ?? 50,
      width: width,
      child: FilledButton(
        onPressed: onpressed,
        style: FilledButton.styleFrom(
          padding: padding,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: elevation,
          shadowColor: const Color(0xffb9d8a0),
          backgroundColor: backgroundColor,
          foregroundColor: foreGroundColor,
        ),
        child: child ??
            Text(
              text ?? '',
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
        ),
        onPressed: onpressed,
        child: child ?? Text(text ?? ''),
      ),
    );
  }
}
