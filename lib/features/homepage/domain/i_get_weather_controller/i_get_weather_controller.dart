import 'package:injectable/injectable.dart';
import 'package:quantum_fetch/quantum_fetch.dart';
import 'package:weather_app_ajaya/features/homepage/data/models/weather_response_model.dart';
import 'package:weather_app_ajaya/features/homepage/domain/i_get_weather_repository/i_get_weather_repository.dart';

abstract class IGetWeatherController {
  Future<APIResponse<WeatherResponseModel>> getCurrentWeatherFromLatLng();
  Future<APIResponse<WeatherResponseModel>> getCurrentWeatherFromPlaceName();
}

@Injectable(as: IGetWeatherController)
class GetWeatherController implements IGetWeatherController {
  final IGetWeatherRepository _repository;

  GetWeatherController(this._repository);
  @override
  Future<APIResponse<WeatherResponseModel>>
      getCurrentWeatherFromLatLng() async {
    return await _repository.getCurrentWeatherFromLatLng();
  }

  @override
  Future<APIResponse<WeatherResponseModel>>
      getCurrentWeatherFromPlaceName() async {
    return await _repository.getCurrentWeatherFromPlaceName();
  }
}
