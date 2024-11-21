import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_ajaya/core/constants/app_const.dart';
import 'package:weather_app_ajaya/core/session/i_session_manager.dart';

@Injectable(as: ISessionManager)
class SessionManager implements ISessionManager {
  @override
  Future<String?> getSavedLocation() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(AppConst.location);
  }

  @override
  Future<void> saveLocation({required String name}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(AppConst.location, name);
  }
}
