import 'package:quantum_fetch/quantum_fetch.dart';
import 'package:weather_app_ajaya/features/homepage/data/models/weather_response_model.dart';

abstract class IGetWeatherRepository {
  Future<APIResponse<WeatherResponseModel>> getCurrentWeatherFromLatLng();
  Future<APIResponse<WeatherResponseModel>> getCurrentWeatherFromPlaceName();
}
