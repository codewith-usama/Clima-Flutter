import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    // getLocation();
  }

  void getData() async {
    String uriString = 'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=34e6e94caa9da427b52e53207103a5b6';
    Uri uri = Uri.parse(uriString);
    http.Response response = await http.get(uri);
    if(response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      var temperatue = decodedData['main']['temp'];
      print(temperatue);
      var condition = decodedData['weather'][0]['id'];
      print(condition);
      var cityName = decodedData['name'];
      print(cityName);
    }
    else {
      print(response.statusCode);
    }
  }

  void getLocation() async {
    Location location = Location();
    await location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    getLocation();
    return const Scaffold();
  }
}
