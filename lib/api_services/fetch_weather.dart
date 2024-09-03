import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/api_services/apikey.dart';

import 'package:weather/model/current_weather.dart';
import 'package:http/http.dart' as http;

class FetchWeather {
  CurrentWeather? currentWeather;

  // api set up

  final String baseUrl = "https://api.openweathermap.org/data/2.5/weather";

  Future<CurrentWeather> fetchWeather(String cityName) async {
    final url = "$baseUrl?q=$cityName&appid=$apiKey&units=metric";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return CurrentWeather.fromJson(json);
    } else {
      throw Exception("Failed to load weather data");
    }
  }

// method to get the current city
  Future<String> getCurrentCity() async {
    // get user permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return "Location permissions are permanently denied";
      }
      if (permission == LocationPermission.denied) {
        return 'Location permission denied';
      }
    }

    // fetch the current location
    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      return 'location not found';
    }

    // ensure position is valid
    if (position.latitude == 0.0 && position.longitude == 0.0) {
      return 'invalid coordinates';
    }

    // get the placemark city from the coordinates
    List<Placemark> placemarks;
    try {
      placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
    } catch (e) {
      return ' address not found';
    }

    // get current city
    final String? city = placemarks.isNotEmpty ? placemarks[0].locality : null;

    // return the city or a default message
    return city ?? "No city found";
  }
}
