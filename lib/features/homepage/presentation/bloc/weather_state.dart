part of 'weather_bloc.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;
  const factory WeatherState.loading() = _Loading;
  const factory WeatherState.success({required WeatherResponseModel? data}) =
      _Success;
  const factory WeatherState.fail({required String message}) = _Fail;
}
