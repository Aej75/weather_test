import 'package:injectable/injectable.dart';
import 'package:weather_app_ajaya/config/fetch_config.dart';

@module
abstract class RegisterModule {
  @singleton
  WeatherAppClient get quantumFetch => WeatherAppClient(MyFetchConfig());
}

class $RegisterModule extends RegisterModule {}
