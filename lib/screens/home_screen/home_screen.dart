import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/grocery_list_tab/grocery_list_tab.dart';
import 'package:recipe_app/screens/home_screen/meal_plan_tab/meal_plan_tab.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/delete_recipe_dialog.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipes_tab.dart';
import 'package:recipe_app/screens/home_screen/settings_tab/settings_tab.dart';
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
    homeController.tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => Scaffold(
            resizeToAvoidBottomInset: false,
            body: DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar: AppBar(
                  actions: [
                    if (homeController.deleteModeEnabled.value)
                      IconButton(
                        onPressed: homeController.recipesChecked.isEmpty
                            ? null
                            : () {
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const DeleteRecipeDialog());
                              },
                        iconSize: 32,
                        icon: Icon(
                          Icons.delete_forever,
                          color: homeController.recipesChecked.isEmpty
                              ? Colors.grey[800]
                              : Colors.red,
                        ),
                      ),
                  ],
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
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    RecipesTab(),
                    MealPlanTab(),
                    GroceryListTab(),
                    SettingsTab(),
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
