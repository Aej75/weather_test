import 'package:flutter/material.dart';

extension AppScaleExtension on num {
  double get f => this * AppScale().sp; //use for fontsize only
  double get w => this * AppScale().w;

  double get h => this * AppScale().h;

  double get sp => this * AppScale().screenRatio;
}

class AppScale {
  double deviceDPR =
      // ignore: deprecated_member_use
      MediaQueryData.fromView(WidgetsBinding.instance.window).devicePixelRatio;
  double height =
      // ignore: deprecated_member_use
      MediaQueryData.fromView(WidgetsBinding.instance.window).size.height;
  double width =
      // ignore: deprecated_member_use
      MediaQueryData.fromView(WidgetsBinding.instance.window).size.width;

  final double _stadardHeight = 875.43;
  final double _standardDPR = 3.5;
  final double _stdWidth = 412;
  final double _standardWidth = 411.43;

  double get sp => scaleFont(_stdWidth);

  double get w => scaledWidth(_standardWidth);

  double get h => scaledHeight(_stadardHeight);

  double get screenRatio => scaleRatio();

  double get popupMenuButton => scaledHeight(.065);

  double scaledWidth(double widthScale) {
    return width / 100;
  }

  double scaleFont(double widthScale) {
    return width / 412;
  }

  double scaledHeight(double heightScale) {
    return height / 100;
  }

  double scaleRatio() {
    // if (_standardDPR > deviceDPR)
    //   return _standardDPR / deviceDPR;
    // else
    return deviceDPR / _standardDPR;
  }
}

double kProductTileHeight = 290;
