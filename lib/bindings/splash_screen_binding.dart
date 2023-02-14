import 'package:get/get.dart';
import 'package:recipe_app/controllers/recipe_controller.dart';
import 'package:recipe_app/controllers/home_controller.dart';
import 'package:recipe_app/controllers/view_recipe_controller.dart';

class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<RecipeController>(() => RecipeController(), fenix: true);
    Get.lazyPut<ViewRecipeController>(() => ViewRecipeController(),
        fenix: true);
  }
}
