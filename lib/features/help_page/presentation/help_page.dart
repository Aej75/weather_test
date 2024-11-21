import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:weather_app_ajaya/core/constants/app_size_const.dart';
import 'package:weather_app_ajaya/core/routes/app_router.gr.dart';
import 'package:weather_app_ajaya/core/utils/miscellaneous/spacing_utils.dart';
import 'package:weather_app_ajaya/core/widgets/app_button.dart';
import 'package:weather_app_ajaya/core/widgets/app_text.dart';
import 'package:weather_app_ajaya/core/widgets/base_view.dart';

@RoutePage()
class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  Timer? _timer;
  int _remainingTime = 5;

  @override
  void initState() {
    super.initState();
    _startRedirectTimer();
  }

  void _startRedirectTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer?.cancel();
        if (mounted) {
          context.router.pushAndPopUntil(
            const Homepage(),
            predicate: (route) => false,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      resizeToAvoidBottomInset: false,
      enableSafeArea: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppTextRegular(
                    text: 'We show weather for you',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  AppButton.outlined(
                    context: context,
                    onpressed: () {
                      _timer?.cancel();
                      context.router.pushAndPopUntil(
                        const Homepage(),
                        predicate: (route) => false,
                      );
                    },
                    text: 'Skip',
                  ),
                ],
              ),
              verticalSpacing(space: 10.h),
              AppTextRegular(
                text: '$_remainingTime\nseconds',
                textAlign: TextAlign.center,
                fontSize: 32,
              ),
            ],
          ).padding(vertical: 8.h),
        ],
      ),
    );
  }
}
