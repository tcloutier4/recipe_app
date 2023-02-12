import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(color: Color.fromARGB(255, 125, 226, 209)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 125, 226, 209)),
    colorSchemeSeed: const Color.fromARGB(255, 125, 226, 209),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color.fromARGB(255, 125, 226, 209)),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: Color.fromARGB(255, 125, 226, 209)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 125, 226, 209)),
    colorSchemeSeed: const Color.fromARGB(255, 125, 226, 209),
  );

  static Rx<ThemeMode> themeMode = ThemeMode.dark.obs;
  static Rx<Color> iconButtonColor =
      const Color.fromARGB(255, 125, 226, 209).obs;
  // static Color iconColor = Colors.white70;

  void enableLightMode() {
    themeMode.value = ThemeMode.light;
    iconButtonColor = const Color.fromARGB(255, 125, 226, 209).obs;
  }

  void enableDarkMode() {
    themeMode.value = ThemeMode.dark;
    iconButtonColor = const Color.fromARGB(255, 125, 226, 209).obs;
  }
}
