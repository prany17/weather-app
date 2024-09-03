import 'package:get/get.dart';
import 'package:weather/api_services/fetch_weather.dart';
import 'package:weather/model/current_weather.dart';

class GlobalController extends GetxController {
  var isLoading = false.obs;
  var currentWeather = CurrentWeather().obs;

  final FetchWeather _fetchWeather = FetchWeather();

  // get weather for current location of user

  fetchWeather() async {
    try {
      isLoading(true);
      final String cityName = await _fetchWeather.getCurrentCity();
      final weather = await _fetchWeather.fetchWeather(cityName);
      currentWeather.value = weather;
    } catch (e) {
      Get.snackbar('Error', 'failed to load weather');
    } finally {
      isLoading(false);
    }
  }

  // get weather for location entered by user

  void getWeather(String cityName) async {
    try {
      isLoading(true);
      final weather = await _fetchWeather.fetchWeather(cityName);
      currentWeather.value = weather;
    } catch (e) {
      Get.snackbar("Error", 'Failed to load weather data');
    } finally {
      isLoading(false);
    }
  }
}
