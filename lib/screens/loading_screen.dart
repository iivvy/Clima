import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apikey = "4355895999401bd4f34e6a44ed3da473" ;

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
double lat ;
double lon;

class _LoadingScreenState extends State<LoadingScreen> {

  void initState(){
    super.initState();
    print("the init function is working");
    getCurrentPosData();


  }
  void getCurrentPosData() async{
    Location location = Location();
    await location.getLocation();
    lat = location.lat;
    lon = location.lon;
    NetworkHelper network = NetworkHelper( 'https://samples.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey');
    var  weatherData = await network.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather:weatherData,);
    }));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );

  }


}


