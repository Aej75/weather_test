import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quantum_fetch/quantum_fetch.dart';
import 'package:weather_app_ajaya/core/injection/injection.dart';
import 'package:weather_app_ajaya/core/session/i_session_manager.dart';
import 'package:weather_app_ajaya/features/homepage/data/models/weather_response_model.dart';
import 'package:weather_app_ajaya/features/homepage/domain/i_get_weather_controller/i_get_weather_controller.dart';

part 'weather_bloc.freezed.dart';
part 'weather_event.dart';
part 'weather_state.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final IGetWeatherController controller;
  WeatherBloc(this.controller) : super(const _Initial()) {
    on<WeatherEvent>((event, emit) async {
      await event.whenOrNull(
        getWeatherInfo: () async {
          emit(const _Loading());

          final name = await getIt<ISessionManager>().getSavedLocation();

          APIResponse<WeatherResponseModel> response;

          if (name == null || name.isEmpty) {
            response = await controller.getCurrentWeatherFromLatLng();
          } else {
            response = await controller.getCurrentWeatherFromPlaceName();
          }

          response.success
              ? emit(_Success(data: response.data))
              : emit(
                  _Fail(message: response.message ?? 'Something went wrong'),
                );
        },
      );
    });
  }
}
