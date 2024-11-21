import 'package:weather_app_ajaya/core/constants/app_const.dart';

class ApiKeys {
  static String fromLatLng({required double lat, required double lng}) =>
      '/current.json?q=$lat,$lng&key=${AppConst.weatherApiKey}';
  static String fromName({required String name}) =>
      '/current.json?q=$name&key=${AppConst.weatherApiKey}';
}
