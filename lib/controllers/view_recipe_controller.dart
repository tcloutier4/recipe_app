import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/models/ingredient.dart';
import 'package:recipe_app/models/recipe.dart';

class ViewRecipeController extends GetxController {
  static ViewRecipeController instance = Get.find();

  //Navigation
  RxInt tabIndex = 0.obs;
  TabController? tabController;

  //Current recipe
  Rx<Recipe> recipe =
      Rx<Recipe>(Recipe(tags: [], ingredients: [], instructions: []));

  //Details screen
  TextEditingController editServingsController = TextEditingController();
  RxInt initialServings = 0.obs;
  RxList<Ingredient> displayIngredients = <Ingredient>[].obs;
  RxInt displayServings = 0.obs;
  RxString servingsWarning = ''.obs;

  void initialize(
      {required TickerProvider ticker, required Recipe currentRecipe}) {
    tabController = TabController(length: 2, vsync: ticker)
      ..addListener(() {
        tabIndex.value = tabController!.index;
      });
    tabIndex = 0.obs;

    setRecipe(currentRecipe: currentRecipe);
  }

  void setRecipe({required Recipe currentRecipe}) {
    recipe.value = currentRecipe;
    editServingsController.text = currentRecipe.servings.toString();
    initialServings.value = currentRecipe.servings;
    displayServings.value = currentRecipe.servings;
    displayIngredients.clear();
    for (Ingredient ingredient in currentRecipe.ingredients) {
      displayIngredients.add(Ingredient.deepCopy(ingredient));
    }
  }

  Future<void> selectTab(int index) async {
    tabIndex.value = index;
    tabController?.index = index;
  }

  void editServings(int newServings) {
    displayIngredients.clear();
    for (Ingredient ingredient in recipe.value.ingredients) {
      displayIngredients.add(Ingredient.deepCopy(ingredient));
    }
    displayServings.value = newServings;
    for (Ingredient ingredient in displayIngredients) {
      ingredient.amount =
          ingredient.amount * newServings / initialServings.value;
    }
  }
}
