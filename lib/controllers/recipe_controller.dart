import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/models/recipe_model.dart';

class RecipeController extends GetxController {
  static RecipeController instance = Get.find();

  //Navigation
  RxInt tabIndex = 0.obs;
  TabController? tabController;

  //Fields for recipes
  Rx<Recipe> recipe = Rx<Recipe>(Recipe(tags: []));
  Rx<String> currentTag = ''.obs;
  RxList<String> currentTags = RxList<String>([]);

  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController tagController = TextEditingController();

  void initialize(TickerProvider ticker) {
    tabController = TabController(length: 3, vsync: ticker)
      ..addListener(() {
        tabIndex.value = tabController!.index;
      });
    tabIndex = 0.obs;
    recipe = Rx<Recipe>(Recipe(tags: []));
    currentTag = ''.obs;
    currentTags = RxList<String>([]);
    titleController.clear();
    timeController.clear();
    tagController.clear();
  }

  Future<void> selectTab(int index) async {
    tabIndex.value = index;
    tabController?.index = index;
  }

  bool hasChanges() {
    return !(titleController.text == '' &&
        timeController.text == '' &&
        tagController.text == '' &&
        currentTags.isEmpty);
  }
}
