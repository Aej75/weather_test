import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:weather_app_ajaya/core/constants/app_size_const.dart';
import 'package:weather_app_ajaya/core/utils/app_utils.dart';
import 'package:weather_app_ajaya/core/utils/miscellaneous/spacing_utils.dart';
import 'package:weather_app_ajaya/core/widgets/app_button.dart';
import 'package:weather_app_ajaya/core/widgets/app_text_field.dart';
import 'package:weather_app_ajaya/features/homepage/presentation/bloc/weather_bloc.dart';
import 'package:weather_app_ajaya/features/homepage/presentation/cubit/saved_location_cubit.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final SavedLocationCubit cubit;

  const SearchField(
      {super.key,
      required this.controller,
      required this.formKey,
      required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SavedLocationCubit, SavedLocationState>(
      listener: (context, state) {
        state.whenOrNull(
          data: (name) {
            controller.text = name ?? '';
          },
          saveSuccess: () {
            EasyLoading.showToast('Location Saved');
            cubit.get();
            context
                .read<WeatherBloc>()
                .add(const WeatherEvent.getWeatherInfo());
          },
          failed: () {
            EasyLoading.showError('Error saving!');
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox(),
          data: (name) => Row(
            children: [
              AppTextField(
                label: 'Enter location',
                controller: controller,
                hint: 'e.g., Kathmandu',
                validator: (value) =>
                    AppUtils.validateNotEmpty(value, 'Location'),
              ).expanded(),
              horizontalSpacing(space: 2.w),
              AppButton.filled(
                text: name != null && name.isNotEmpty ? 'Update' : 'Save',
                height: 60,
                context: context,
                onpressed: () {
                  if (formKey.currentState!.validate()) {
                    cubit.saveLocation(name: controller.text);
                  }
                },
              )
            ],
          ).padding(bottom: 16.0),
        );
      },
    );
  }
}
