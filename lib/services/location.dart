import 'package:geolocator/geolocator.dart';
class Location {
  double lon;
  double lat;
  Future <void> getLocation() async {
    try {
      // LocationPermission permission = await Geolocator.checkPermission();
      // LocationPermission permissio = await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      print(position);
      lon = position.longitude;
      lat= position.latitude;
      print(lon);
      print(lat);
    }catch (e) {
      print(e);

    }


  }

}