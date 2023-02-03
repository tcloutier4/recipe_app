import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/models/ingredient.dart';
import 'package:recipe_app/models/recipe.dart';

class RecipeController extends GetxController {
  static RecipeController instance = Get.find();

  //Navigation
  RxInt tabIndex = 0.obs;
  TabController? tabController;

  //Current recipe
  Rx<Recipe> recipe =
      Rx<Recipe>(Recipe(tags: [], ingredients: [], instructions: []));

  //Details screen
  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  Rx<String> currentTag = ''.obs;
  RxList<String> currentTags = RxList<String>([]);

  //Ingredients screen
  TextEditingController servingsController = TextEditingController();
  TextEditingController ingredientNameController = TextEditingController();
  TextEditingController ingredientQuantityController = TextEditingController();
  TextEditingController ingredientUnitController = TextEditingController();
  TextEditingController ingredientTagController = TextEditingController();
  Rx<Ingredient> currentIngredient = Rx<Ingredient>(Ingredient());
  RxList<String> ingredientWarningList = <String>[].obs;

  void initialize(TickerProvider ticker) {
    tabController = TabController(length: 3, vsync: ticker)
      ..addListener(() {
        tabIndex.value = tabController!.index;
      });
    tabIndex = 0.obs;
    recipe = Rx<Recipe>(Recipe(tags: [], ingredients: [], instructions: []));

    currentTag = ''.obs;
    currentTags = RxList<String>([]);
    titleController.clear();
    timeController.clear();
    tagController.clear();
    servingsController.clear();

    resetIngredient();
  }

  void resetIngredient() {
    ingredientNameController.clear();
    ingredientQuantityController.clear();
    ingredientUnitController.clear();
    ingredientTagController.clear();
    currentIngredient = Rx<Ingredient>(Ingredient());
  }

  Future<void> selectTab(int index) async {
    tabIndex.value = index;
    tabController?.index = index;
  }

  RxBool hasChanges() {
    return (!(titleController.text == '' &&
                timeController.text == '' &&
                tagController.text == '' &&
                currentTags.isEmpty &&
                ingredientNameController.text == '' &&
                ingredientQuantityController.text == '' &&
                ingredientTagController.text == '' &&
                //TODO: add a check for initial recipe when I add in update recipes

                recipe.value.isEmpty()
            //
            ))
        .obs;
  }

  void addIngredient() {
    ingredientWarningList.value = [];

    if (ingredientNameController.text.trim().isEmpty) {
      ingredientWarningList.add('Ingredient needs a name');
    }
    if (ingredientQuantityController.text.trim().isNotEmpty &&
        !ingredientQuantityController.text.trim().startsWith(RegExp("[0-9]"))) {
      ingredientWarningList.add('Quantity needs to start with a number');
    } else {
      parseIngredientQuantity(ingredientQuantityController.text.trim());
    }
    if (ingredientWarningList.isEmpty) {
      currentIngredient.value.name = ingredientNameController.text;
      currentIngredient.value.tag = ingredientTagController.text;

      recipe.value.ingredients.add(currentIngredient.value);
      resetIngredient();
    }
  }

  void parseIngredientQuantity(String quantity) {
    int index = quantity.indexOf(RegExp('[a-zA-Z]'));
    if (index != -1) {
      double? amount = double.tryParse(quantity.substring(0, index).trim());
      if (amount != null && amount > 0) {
        currentIngredient.value.amount = amount;
        currentIngredient.value.unit = quantity.substring(index).trim();
      } else {
        ingredientWarningList
            .add('Ingredient amount must be a decimal greater than 0');
      }
    }
  }
}
