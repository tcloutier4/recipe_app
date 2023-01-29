import 'package:get/get.dart';
import 'package:recipe_app/models/recipe_model.dart';

class RecipeController extends GetxController {
  static RecipeController instance = Get.find();

  //Fields for recipes
  Rx<Recipe> recipe = Rx<Recipe>(Recipe());
  Rx<String> currentTag = ''.obs;
}
