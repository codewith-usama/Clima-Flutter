import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';


const apiKey = '34e6e94caa9da427b52e53207103a5b6';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude = 0;
  double longitude = 0;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(url: 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networkHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LocationScreen()
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          size: 100.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
