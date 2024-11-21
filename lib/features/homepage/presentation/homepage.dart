import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:weather_app_ajaya/core/constants/app_size_const.dart';
import 'package:weather_app_ajaya/core/injection/injection.dart';
import 'package:weather_app_ajaya/core/routes/app_router.gr.dart';
import 'package:weather_app_ajaya/core/utils/miscellaneous/spacing_utils.dart';
import 'package:weather_app_ajaya/core/widgets/app_button.dart';
import 'package:weather_app_ajaya/core/widgets/app_text.dart';
import 'package:weather_app_ajaya/core/widgets/base_view.dart';
import 'package:weather_app_ajaya/features/homepage/presentation/bloc/weather_bloc.dart';
import 'package:weather_app_ajaya/features/homepage/presentation/cubit/saved_location_cubit.dart';
import 'package:weather_app_ajaya/features/homepage/presentation/widget/search_field.dart';
import 'package:weather_app_ajaya/features/homepage/presentation/widget/weather_data_section.dart';

@RoutePage()
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _locationController = TextEditingController();
  final saveCubit = getIt<SavedLocationCubit>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<WeatherBloc>().add(const WeatherEvent.getWeatherInfo());
    super.initState();
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => saveCubit..get(),
      child: Form(
        key: _formKey,
        child: BaseView(
          enableSafeArea: false,
          resizeToAvoidBottomInset: false,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppTextRegular(
                    text: 'Weather App',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  AppButton.outlined(
                    context: context,
                    onpressed: () {
                      context.router.pushAndPopUntil(
                        const HelpRoute(),
                        predicate: (route) => false,
                      );
                    },
                    text: 'Help',
                  )
                ],
              ),
              verticalSpacing(space: 4.h),
              SearchField(
                controller: _locationController,
                formKey: _formKey,
                cubit: saveCubit,
              ),
              // SavedLocationSection(cubit: saveCubit),
              const Divider(),
              const WeatherDataSection()
            ],
          ).padding(top: 10.h),
        ),
      ),
    );
  }
}
