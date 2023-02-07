import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/grocery_list_screen/grocery_list_screen.dart';
import 'package:recipe_app/screens/home_screen/meal_plan_screen/meal_plan_screen.dart';
import 'package:recipe_app/screens/home_screen/recipe_screen/recipes_screen.dart';
import 'package:recipe_app/widgets/home_screen_widgets/home_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    homeController.tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => Scaffold(
            body: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  leading: TextButton(
                      onPressed: () {}, child: const Text('testing')),
                  elevation: 3,
                  title: Text(
                    homeController.title.value,
                  ),
                  centerTitle: true,
                ),
                body: TabBarView(
                  controller: homeController.tabController,
                  children: const [
                    RecipesPage(),
                    MealPlanScreen(),
                    GroceryListScreen(),
                  ],
                ),
                bottomNavigationBar: HomeBottomNavBar(
                  const Key('BottomNavBar'),
                  homeController.tabIndex.value,
                  (index) {
                    homeController.selectTab(index);
                  },
                ),
              ),
            ),
          )),
    );
  }
}
