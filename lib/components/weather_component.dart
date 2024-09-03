import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/components/sizedBox_component.dart';
import 'package:weather/controller/global_controller.dart';

class WeatherComponent extends StatelessWidget {
  WeatherComponent({
    super.key,
  });

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25),
          // city name
          child: Text(
            '${globalController.currentWeather.value.name}',
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          'assets/weather/${globalController.currentWeather.value.weather?[0].icon}.png',
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 30,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // temperature
              Text(
                '${(globalController.currentWeather.value.main?.temp)?.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 100,
                  color: Colors.white,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0),

                // degree symbol
                child: Text(
                  '°C',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // condition
            Text(
              '${globalController.currentWeather.value.weather?[0].description}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 20),
            // maximum temp
            Text(
              '${(globalController.currentWeather.value.main?.tempMax)?.toStringAsFixed(0)}°',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3, right: 6),
              // "/" symbol
              child: Text(
                '/',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade300,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            // minimum temp
            Text(
              '${(globalController.currentWeather.value.main?.tempMin)?.toStringAsFixed(0)}°',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blueGrey.shade700,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 12, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedboxComponent(
                        title: 'Wind speed',
                        valueof:
                            ('${globalController.currentWeather.value.wind?.speed} km/hr')
                                .toString()),
                    SizedboxComponent(
                        title: 'Humidity',
                        valueof:
                            ('${globalController.currentWeather.value.main?.humidity} %')
                                .toString()),
                    SizedboxComponent(
                        title: 'Clouds',
                        valueof:
                            ('${globalController.currentWeather.value.clouds?.all} %')
                                .toString()),
                    SizedboxComponent(
                        title: 'Pressure',
                        valueof:
                            ('${globalController.currentWeather.value.main?.pressure} atm')
                                .toString()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
