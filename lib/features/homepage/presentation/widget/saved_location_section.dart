// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:weather_app_ajaya/core/widgets/app_text.dart';
// import 'package:weather_app_ajaya/core/widgets/app_text_field.dart';
// import 'package:weather_app_ajaya/features/homepage/presentation/bloc/weather_bloc.dart';
// import 'package:weather_app_ajaya/features/homepage/presentation/cubit/saved_location_cubit.dart';

// class SavedLocationSection extends StatelessWidget {
//   final SavedLocationCubit cubit;
//   const SavedLocationSection({super.key, required this.cubit});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SavedLocationCubit, SavedLocationState>(
//       listener: (context, state) {
//         state.whenOrNull(
//           saveSuccess: () {
//             EasyLoading.showToast('Location Saved');
//             cubit.get();
//             context
//                 .read<WeatherBloc>()
//                 .add(const WeatherEvent.getWeatherInfo());
//           },
//           failed: () {
//             EasyLoading.showError('Error saving!');
//           },
//         );
//       },
//       builder: (context, state) {
//         return state.maybeWhen(
//           orElse: () => const SizedBox(),
//           data: (name) => name != null && name.isNotEmpty
//               ?  Row(
//                   children: [
//                     AppTextField(
//                       label: 'Enter location',
//                       controller: controller,
//                       hint: 'e.g., Kathmandu',
//                       validator: (value) =>
//                           AppUtils.validateNotEmpty(value, 'Location'),
//                     ).expanded(),
//                     horizontalSpacing(space: 8.0),
//                     AppButton.filled(
//                       text: 'Save',
//                       height: 60,
//                       context: context,
//                       onpressed: () {
//                         if (formKey.currentState!.validate()) {
//                           cubit.saveLocation(name: controller.text);
//                         }
//                       },
//                     )
//                   ],
//                 ).padding(bottom: 16.0)
//               : const SizedBox(),
//         );
//       },
//     );
//   }
// }
