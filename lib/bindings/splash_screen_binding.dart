import 'package:get/get.dart';
import 'package:recipe_app/controllers/recipe_controller.dart';
import 'package:recipe_app/controllers/home_controller.dart';

class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => RecipeController());
  }
}
