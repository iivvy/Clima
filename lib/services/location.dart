import 'package:geolocator/geolocator.dart';
class Location {
  double lon;
  double lat;
  Future <void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
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