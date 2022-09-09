import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' ;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void initState(){
    super.initState();
    print("the init function is working");
    getCurrentPos();
    fetchdata();

  }
  void getCurrentPos() async{
    Location location = new Location();
    await location.getLocation();
  }
  Future<Response> fetchdata() async {
    final response = await get(Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22'));
    String data=response.body;
    double lon = jsonDecode(response.body)['coord']['lon'];
    double lat = jsonDecode(response.body)['coord']['lat'];
    int condition = jsonDecode(data)['weather'][0]['id'];
    double temp = jsonDecode(data)['main']['temp'];
    String city = jsonDecode(data)['name'];
    print(condition);
    print(city);



  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            fetchdata();
            // getLocation();
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}


