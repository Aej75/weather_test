import 'package:injectable/injectable.dart';
import 'package:quantum_fetch/quantum_fetch.dart';
import 'package:weather_app_ajaya/config/fetch_config.dart';
import 'package:weather_app_ajaya/core/constants/api_keys.dart';
import 'package:weather_app_ajaya/core/injection/injection.dart';
import 'package:weather_app_ajaya/core/session/i_session_manager.dart';
import 'package:weather_app_ajaya/core/utils/app_utils.dart';
import 'package:weather_app_ajaya/features/homepage/data/models/weather_response_model.dart';
import 'package:weather_app_ajaya/features/homepage/domain/i_get_weather_repository/i_get_weather_repository.dart';

@Injectable(as: IGetWeatherRepository)
class GetWeatherRepository implements IGetWeatherRepository {
  final WeatherAppClient _client;

  GetWeatherRepository(this._client);
  @override
  Future<APIResponse<WeatherResponseModel>>
      getCurrentWeatherFromLatLng() async {
    try {
      final myLocationInfo = await AppUtils.determinePosition();

      final response = await _client.get<WeatherResponseModel>(
          ApiKeys.fromLatLng(
              lat: myLocationInfo.latitude, lng: myLocationInfo.longitude),
          decoder: WeatherResponseModel.fromJson);

      return response;
    } catch (e) {
      return APIResponse(success: false, message: e.toString());
    }
  }

  @override
  Future<APIResponse<WeatherResponseModel>>
      getCurrentWeatherFromPlaceName() async {
    final name = await getIt<ISessionManager>().getSavedLocation();

    return await _client.get<WeatherResponseModel>(
        ApiKeys.fromName(name: name!),
        decoder: WeatherResponseModel.fromJson);
  }
}
