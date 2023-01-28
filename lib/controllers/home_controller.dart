import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  //Fields for recipes
  RxString title = 'Recipes'.obs;
  RxInt tabIndex = 0.obs;

  TabController? tabController;

  Future<void> selectTab(int index) async {
    List<String> appBarTitle = ['Recipes', 'Meal Plan', 'Groceries'];
    tabIndex.value = index;
    tabController?.index = index;
    title.value = appBarTitle[index];
  }
}
