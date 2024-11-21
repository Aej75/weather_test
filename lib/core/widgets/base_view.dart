import 'package:flutter/material.dart';
import 'package:weather_app_ajaya/core/constants/app_color.dart';
import 'package:weather_app_ajaya/core/constants/app_size_const.dart';
import 'package:weather_app_ajaya/core/widgets/app_text.dart';
import 'package:weather_app_ajaya/gen/assets.gen.dart';

class BaseView extends StatelessWidget {
  final Widget body;
  final String? titleText;
  final Color? appBarColor;
  final Color? color;
  final bool resizeToAvoidBottomInset;
  final Function(bool)? onBackCallback;
  final List<Widget> actions;
  final EdgeInsets padding;
  final Widget? bottomSheet;
  final PreferredSizeWidget? appBar;
  final FloatingActionButtonLocation? fabLocation;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? customBottomNavigationBar;
  final Widget? leading;
  final PreferredSizeWidget? bottomWidget;
  final double elevation;
  final bool extentBody;
  final bool enableSafeArea;
  final Widget? appBarWidget;

  const BaseView(
      {super.key,
      this.titleText,
      this.appBar,
      this.fabLocation,
      this.floatingActionButton,
      required this.body,
      this.appBarColor,
      this.color,
      this.resizeToAvoidBottomInset = true,
      this.onBackCallback,
      this.bottomSheet,
      this.padding = const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      this.actions = const [],
      this.bottomNavigationBar,
      this.bottomWidget,
      this.elevation = 0,
      this.leading,
      this.extentBody = false,
      this.customBottomNavigationBar,
      this.enableSafeArea = true,
      this.appBarWidget});

  @override
  Widget build(BuildContext context) => PopScope(
        onPopInvoked: onBackCallback,
        child: Scaffold(
          extendBody: extentBody,
          floatingActionButtonLocation: fabLocation,
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar ?? customBottomNavigationBar,
          bottomSheet: bottomSheet,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          appBar: appBar ?? toolbar(context),
          body: Container(
              width: 100.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity: 0.1,
                  image: AssetImage(
                    Assets.background.weatherBackground,
                  ),
                ),
              ),
              padding: padding,
              child: body),
        ),
      );

  PreferredSize toolbar(BuildContext context) => PreferredSize(
        preferredSize: Size.fromHeight(bottomWidget != null
            ? 140.0
            : titleText != null || appBarWidget != null
                ? 80.0
                : 0.0),
        child: titleText != null || enableSafeArea || appBarWidget != null
            ? AppBar(
                toolbarHeight: 100,
                centerTitle: true,
                surfaceTintColor: Colors.transparent,
                backgroundColor: AppColor.backgroundColor,
                leading: leading,
                actions: actions,
                elevation: elevation,
                title: appBarWidget ??
                    AppTextRegular(
                      text: titleText ?? '',
                      fontSize: 20,
                    ),
                bottom: bottomWidget,
              )
            : const SizedBox(),
      );
}
