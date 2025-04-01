import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swith_dark_light_with_getx/home_view.dart'; // Import the HomeView widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController controller = Get.put(
    ThemeController(),
  ); // Initialize ThemeController

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // GetX automatically rebuilds when 'isDarkMode' changes
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode:
            controller.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        home: HomeView(), // Use HomeView as the home page
      );
    });
  }
}
