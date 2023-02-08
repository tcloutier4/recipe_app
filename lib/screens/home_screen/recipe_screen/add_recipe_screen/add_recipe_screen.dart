import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/local/hive_storage.dart';
import 'package:recipe_app/screens/home_screen/recipe_screen/add_recipe_screen/details_screen.dart';
import 'package:recipe_app/screens/home_screen/recipe_screen/add_recipe_screen/ingredients_screen.dart';
import 'package:recipe_app/screens/home_screen/recipe_screen/add_recipe_screen/instructions_screen.dart';
import 'package:recipe_app/screens/home_screen/recipe_screen/recipe_bottom_nav_bar.dart';

import '../../../../models/recipe.dart';
import '../../../../shared/utility_functions.dart';

class AddRecipeScreen extends StatefulWidget {
  final Recipe? initialRecipe;
  const AddRecipeScreen({
    Key? key,
    this.initialRecipe,
  }) : super(key: key);

  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    recipeController.initialize(this);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Obx(
        (() => DefaultTabController(
              length: 3,
              child: Scaffold(
                key: const Key("AddRecipeScaffoldKey"),
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  titleSpacing: 0,
                  leading: IconButton(
                    splashRadius: 32,
                    iconSize: 32,
                    icon: const Icon(Icons.arrow_back_rounded),
                    onPressed: () async {
                      if (recipeController.hasChanges().value) {
                        await showUnsavedDataWarningDialog(
                          context,
                          () => {Navigator.of(context).pop()},
                        );
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  title: Text(
                    (widget.initialRecipe != null)
                        ? 'Update Recipe'
                        : 'Create Recipe',
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        onPressed: () async {
                          HiveStorage.post(
                              key: recipeController.recipe.value.id,
                              data: recipeController.recipe.value,
                              box: 'recipes');

                          homeController.getRecipes();
                        },
                        iconSize: 32,
                        icon: const Icon(
                          Icons.add,
                        ))
                  ],
                  bottomOpacity: 0.0,
                  elevation: 3.0,
                ),
                body: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * .025,
                    left: MediaQuery.of(context).size.width * .025,
                    right: MediaQuery.of(context).size.width * .025,
                  ),
                  child: TabBarView(
                      controller: recipeController.tabController,
                      children: const [
                        DetailsScreen(),
                        IngredientsScreen(),
                        InstructionsScreen()
                      ]),
                ),
                bottomNavigationBar: RecipeBottomNavBar(
                  const Key('RecipeNavBar'),
                  recipeController.tabIndex.value,
                  (index) {
                    recipeController.selectTab(index);
                  },
                ),
              ),
            )),
      ),
    );
  }
}
