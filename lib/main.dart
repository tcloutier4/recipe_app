import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/bindings/splash_screen_binding.dart';
import 'package:recipe_app/screens/home_screen/home_screen.dart';
import 'package:recipe_app/shared/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  SplashScreenBinding().dependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            foregroundColor: colorFloralWhite,
            backgroundColor: colorBrownTeddy),
      ),
      home: const HomeScreen(),
    );
  }
}
