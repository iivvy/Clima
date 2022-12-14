import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = "4355895999401bd4f34e6a44ed3da473";
const apiURL = 'https://api.openweathermap.org/data/2.5/weather?';


class WeatherModel{
  Future<dynamic> serachweather(cityname)async{
    NetworkHelper network = NetworkHelper('${apiURL}q=$cityname&appid=$apikey&units=metric');
    var searchdata = await network.getData();
    return searchdata;

  }
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();
    NetworkHelper network = NetworkHelper(
        '${apiURL}lat=${location.lat}&lon=${location.lon}&appid=$apikey&units=metric');
    var weatherData = await network.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time at';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
