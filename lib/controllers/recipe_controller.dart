import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/local/hive_storage.dart';
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
  RxString successString = ''.obs;

  //Instructions screen
  TextEditingController instructionController = TextEditingController();
  TextEditingController editInstructionController = TextEditingController();

  void initialize(TickerProvider ticker) {
    tabController = TabController(length: 3, vsync: ticker)
      ..addListener(() {
        tabIndex.value = tabController!.index;
      });
    tabIndex = 0.obs;
    recipe = Rx<Recipe>(Recipe(
        id: HiveStorage.getNextIndex(box: 'recipes'),
        tags: [],
        ingredients: [],
        instructions: []));

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

  void setIngredient(Ingredient ingredient) {
    ingredientNameController.text = ingredient.name;
    ingredientQuantityController.text = ingredient.displayAmount();
    ingredientTagController.text = ingredient.tag;
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
                recipe.value.isEmpty()
            //
            ))
        .obs;
  }

  bool addIngredient({int? index}) {
    bool ingredientAdded = false;
    ingredientWarningList.value = [];

    if (ingredientNameController.text.trim().isEmpty) {
      ingredientWarningList.add('Ingredient needs a name');
    }
    if (ingredientQuantityController.text.trim().isNotEmpty &&
        !ingredientQuantityController.text.trim().startsWith(RegExp("[0-9]"))) {
      ingredientWarningList.add('Quantity needs to start with a number');
    } else {
      if (ingredientQuantityController.text.trim().isNotEmpty) {
        parseIngredientQuantity(ingredientQuantityController.text.trim());
      }
    }
    if (ingredientWarningList.isEmpty) {
      currentIngredient.value.name = ingredientNameController.text;
      currentIngredient.value.tag = ingredientTagController.text;

      if (index == null) {
        recipe.value.ingredients.add(currentIngredient.value);
      } else {
        recipe.value.ingredients[index] = currentIngredient.value;
      }
      ingredientAdded = true;
      successString =
          'added ${currentIngredient.value.displayIngredient()}'.obs;

      recipe.refresh();

      resetIngredient();
    }

    return ingredientAdded;
  }

  void deleteIngredient({required int index}) {
    recipe.value.ingredients.removeAt(index);
  }

  void parseIngredientQuantity(String quantity) {
    int letterIndex = quantity.indexOf(RegExp('[a-zA-Z]'));
    double? amount;
    if (letterIndex != -1) {
      amount = double.tryParse(quantity.substring(0, letterIndex).trim());
      if (amount != null && amount > 0) {
        currentIngredient.value.amount = amount;
        currentIngredient.value.unit = quantity.substring(letterIndex).trim();
      } else {
        ingredientWarningList
            .add('Ingredient amount must be a decimal greater than 0');
      }
    } else {
      amount = double.tryParse(quantity.trim());
      if (amount != null && amount > 0) {
        currentIngredient.value.amount = amount;
      } else {
        ingredientWarningList
            .add('Ingredient amount must be a decimal greater than 0');
      }
    }
  }

  void deleteInstruction({required int index}) {
    recipe.value.instructions.removeAt(index);
  }
}
