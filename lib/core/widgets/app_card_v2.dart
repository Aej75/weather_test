import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margine;
  final Widget child;
  final double blurRadius;
  final double spreadRadius;
  final BorderRadiusGeometry? customRadius;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;
  final double elevation;
  final Color backGroundColor;
  const AppCard(
      {super.key,
      this.padding = const EdgeInsets.all(5),
      this.margine = const EdgeInsets.all(5),
      this.blurRadius = 15,
      this.spreadRadius = 1,
      this.height,
      this.width,
      this.onPressed,
      required this.child,
      this.customRadius,
      this.backGroundColor = const Color(0xffFFFFFF),
      this.elevation = 1});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: height ?? 0,
          minWidth: width ?? 0,
        ),
        child: Container(
          margin: margine,
          height: height,
          width: width,
          padding: padding,
          decoration: BoxDecoration(
            color: backGroundColor,
            borderRadius: customRadius ?? BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(elevation * 0.05),
                blurRadius: blurRadius,
                spreadRadius: spreadRadius,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
