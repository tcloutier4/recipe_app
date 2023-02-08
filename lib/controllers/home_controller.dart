import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/local/hive_storage.dart';
import 'package:recipe_app/models/recipe.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  //Navigation
  RxInt tabIndex = 0.obs;
  TabController? tabController;
  RxString title = 'Recipes'.obs;

  //Settings
  ///index 0 is Light, 1 is Dark
  RxList<bool> lightModeSettings = [true, false].obs;

  // RxMap<int, Recipe> recipeList = RxMap({});
  RxList<Recipe> recipeList = <Recipe>[].obs;

  Future<void> selectTab(int index) async {
    List<String> appBarTitle = [
      'Recipes',
      'Meal Plan',
      'Groceries',
      'Settings',
    ];
    tabIndex.value = index;
    tabController?.index = index;
    title.value = appBarTitle[index];
  }

  void getRecipes() {
    // bool test = Hive.isBoxOpen('recipes');
    // print(test);
    recipeList.value =
        Map<int, Recipe>.from(HiveStorage.list(box: 'recipes')).values.toList();
  }
}
