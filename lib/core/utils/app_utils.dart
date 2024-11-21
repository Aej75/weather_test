import 'package:geolocator/geolocator.dart';

class AppUtils {
  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions,\nAllow it mannually',
      );
    }

    return await Geolocator.getCurrentPosition();
  }

  static String? validateNotEmpty(String? value, String type) {
    if (value != null && value.isEmpty) {
      return '$type must not be empty';
    } else {
      return null;
    }
  }
}
