import 'package:flutter/material.dart';

// const colorTeal = Color.fromARGB(255, 0, 199, 204);
// const colorTealLight = Color.fromARGB(255, 51, 210, 214);
// const colorGrey = Color.fromARGB(255, 67, 70, 75);
// const colorGreyLight = Color.fromARGB(255, 105, 107, 111);

const colorFloralWhite = Color.fromARGB(255, 255, 255, 240);
const colorBrownLight = Color.fromARGB(255, 207, 122, 42);
const colorBrown = Color.fromARGB(255, 102, 66, 41);
const colorBrownTeddy = Color.fromARGB(255, 185, 168, 150);

const recipesPage = 0;
const mealPlanPage = 1;
const groceryListPage = 2;




Map<int, GlobalKey<NavigatorState>> navigationKeys = {
  recipesPage: GlobalKey<NavigatorState>(),
  mealPlanPage: GlobalKey<NavigatorState>(),
  groceryListPage: GlobalKey<NavigatorState>(),
};
