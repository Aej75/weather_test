import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:weather_app_ajaya/core/constants/app_color.dart';
import 'package:weather_app_ajaya/core/constants/app_size_const.dart';
import 'package:weather_app_ajaya/core/utils/miscellaneous/spacing_utils.dart';
import 'package:weather_app_ajaya/core/widgets/app_button.dart';
import 'package:weather_app_ajaya/core/widgets/app_card_v2.dart';
import 'package:weather_app_ajaya/core/widgets/app_text.dart';
import 'package:weather_app_ajaya/features/homepage/presentation/bloc/weather_bloc.dart';

class WeatherDataSection extends StatelessWidget {
  const WeatherDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Column(
          children: [
            state.maybeWhen(
              loading: () =>
                  const Center(child: CircularProgressIndicator()).height(10.h),
              fail: (message) => Center(
                child: AppTextRegular(
                  textAlign: TextAlign.center,
                  text: message,
                  fontSize: 18,
                  textColor: Colors.grey,
                ),
              ).height(10.h),
              success: (data) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppCard(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppTextRegular(
                              text: data?.location.country ?? 'Unknown Country',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ).padding(bottom: 1.h),
                            AppTextRegular(
                              text: data?.location.name ?? 'Unknown Reguion',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            verticalSpacing(space: 1.h),
                            AppTextRegular(
                              text: '${data?.current.celsius ?? '--'}°C',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            verticalSpacing(space: .5.h),
                            AppTextRegular(
                              text: data?.current.condition.text ?? '',
                              fontSize: 16,
                            ),
                          ],
                        ).width(50.w),
                        Container(
                          decoration: const BoxDecoration(
                            color: AppColor.signInButtonColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          height: 10.h,
                          width: 10.h,
                          child: CachedNetworkImage(
                            imageUrl: "https:${data?.current.condition.icon}",
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              orElse: () => const Center(
                child: AppTextRegular(
                  textAlign: TextAlign.center,
                  text: 'Something went wrong!',
                  fontSize: 18,
                  textColor: Colors.grey,
                ),
              ).height(10.h),
            ),
            AppButton.filled(
              width: 100.w,
              text: 'Refresh Weather',
              height: 50,
              context: context,
              onpressed: () {
                context
                    .read<WeatherBloc>()
                    .add(const WeatherEvent.getWeatherInfo());
              },
            ).padding(all: 2.w)
          ],
        );
      },
    );
  }
}
