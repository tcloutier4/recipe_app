import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(color: Color.fromARGB(255, 125, 226, 209)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 125, 226, 209)),
    colorSchemeSeed: const Color.fromARGB(255, 125, 226, 209),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: Color.fromARGB(255, 125, 226, 209)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 125, 226, 209)),
    colorSchemeSeed: const Color.fromARGB(255, 125, 226, 209),
  );

  static Rx<ThemeMode> themeMode = ThemeMode.dark.obs;
  // static Color iconColor = Colors.white70;

  void enableLightMode() {
    themeMode.value = ThemeMode.light;
    // iconColor = Colors.black87;
  }

  void enableDarkMode() {
    themeMode.value = ThemeMode.dark;
    // iconColor = Colors.white70;
  }
}
