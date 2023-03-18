import 'package:geolocator/geolocator.dart';

class Location {

  double latitude = 0;
  double longitude = 0;

  Future<void> getLocation() async{
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Handle denied permission
      print("Denied");
    } else if (permission == LocationPermission.deniedForever) {
      // Handle permanently denied permission
      print("permanently denied");
    } else {
      // Permission granted, proceed to get location
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    }
  }
}