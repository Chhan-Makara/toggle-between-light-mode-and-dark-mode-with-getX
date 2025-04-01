import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ThemeController class
class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs; // Observable variable for theme

  // Method to toggle the theme
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value; // Toggle theme state
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the ThemeController
    final ThemeController controller = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Switch dark/light use GetX"),
        actions: [
          IconButton(
            onPressed: controller.toggleTheme, // Call toggleTheme method
            icon: Obx(() {
              // Use Obx to automatically rebuild the icon when isDarkMode changes
              return Icon(
                controller.isDarkMode.value
                    ? Icons.dark_mode
                    : Icons.light_mode,
              );
            }),
          ),
        ],
      ),
      body: Center(
        child: Obx(() {
          // Text will automatically update when isDarkMode changes
          return Text(
            "Current theme: ${controller.isDarkMode.value ? 'Dark' : 'Light'}",
            style: TextStyle(fontSize: 20),
          );
        }),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: HomeView()));
}
