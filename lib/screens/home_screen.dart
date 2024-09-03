import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/components/weather_component.dart';
import 'package:weather/controller/global_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // controller for text field
  final textController = TextEditingController();

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    globalController.fetchWeather();
    super.initState();
  }

  Future<void> refreshMethod() async {
    await Future.delayed(const Duration(milliseconds: 1));
    return globalController.fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      body: RefreshIndicator(
        backgroundColor: Colors.blueGrey.shade800,
        color: Colors.blueGrey.shade800,
        onRefresh: refreshMethod,
        child: Center(
          child: ListView(children: [
            Obx(() {
              if (globalController.isLoading.value) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 350.0),
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                );
              } else {
                return Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, right: 20, left: 20),
                  child: Column(
                    children: [
                      // text field
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextField(
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                globalController
                                    .getWeather(textController.text);
                                if (textController.text.isNotEmpty) {
                                  textController.clear();
                                } else {
                                  Get.snackbar('Error', 'text field is empty');
                                }
                              },
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                            hintText: "Enter City",
                            hintStyle: const TextStyle(
                                fontSize: 16, color: Colors.white),
                            fillColor: Colors.grey.shade100,
                            focusColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade100),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade100),
                            ),
                          ),
                          controller: textController,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: WeatherComponent(),
                      ),
                    ],
                  ),
                );
              }
            }),
          ]),
        ),
      ),
    );
  }
}
