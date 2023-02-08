import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipe_app/bindings/splash_screen_binding.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/models/ingredient.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/screens/home_screen/home_screen.dart';
import 'package:recipe_app/shared/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SplashScreenBinding().dependencies();

  await Future.wait([
    Firebase.initializeApp(),
    BoxCollection.open('hiveStorageDatabase', {'recipes', 'indexes'},
            path: (await getApplicationDocumentsDirectory()).path)
        .then((value) async {
      Hive.registerAdapter(RecipeAdapter());
      Hive.registerAdapter(IngredientAdapter());
      await Hive.openBox('recipes');
      await Hive.openBox('indexes');
    })
  ]).then((value) {
    homeController.getRecipes();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => MaterialApp(
            title: 'Food App',
            theme: AppColors.lightTheme,
            darkTheme: AppColors.darkTheme,
            themeMode: AppColors.themeMode.value,
            home: const HomeScreen(),
          )),
    );
  }
}
