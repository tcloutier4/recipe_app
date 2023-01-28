import 'package:get/get.dart';
import 'package:recipe_app/models/recipe_model.dart';

class AddRecipeController extends GetxController {
  static AddRecipeController instance = Get.find();

  //Fields for recipes
  Rx<Recipe> recipe = Rx<Recipe>(Recipe());
}
