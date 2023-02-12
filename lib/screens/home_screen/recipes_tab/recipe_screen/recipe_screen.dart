import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/local/hive_storage.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/details_tab/details_tab.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/ingredients_tab/ingredients_tab.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/instructions_tab/instructions_tab.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_bottom_nav_bar.dart';
import 'package:recipe_app/shared/app_colors.dart';

import '../../../../models/recipe.dart';
import '../../../../shared/utility_functions.dart';

class RecipeScreen extends StatefulWidget {
  final Recipe? initialRecipe;
  const RecipeScreen({
    Key? key,
    this.initialRecipe,
  }) : super(key: key);

  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    recipeController.initialize(
        ticker: this, currentRecipe: widget.initialRecipe);
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
                resizeToAvoidBottomInset: false,
                key: const Key("AddRecipeScaffoldKey"),
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  titleSpacing: 0,
                  leading: IconButton(
                    splashRadius: 32,
                    iconSize: 32,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.iconButtonColor.value,
                    ),
                    onPressed: () async {
                      if (recipeController
                          .hasChanges(initialRecipe: widget.initialRecipe)
                          .value) {
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
                    widget.initialRecipe == null
                        ? IconButton(
                            onPressed: () async {
                              HiveStorage.post(
                                  key: recipeController.recipe.value.id,
                                  data: recipeController.recipe.value,
                                  box: 'recipes');
                              homeController.getRecipes();
                              Navigator.of(context).pop();
                            },
                            iconSize: 32,
                            icon: Icon(
                              Icons.add,
                              color: AppColors.iconButtonColor.value,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              HiveStorage.update(
                                  key: recipeController.recipe.value.id,
                                  data: recipeController.recipe.value,
                                  box: 'recipes');
                              homeController.getRecipes();
                              Navigator.of(context).pop();
                            },
                            iconSize: 32,
                            icon: Icon(
                              Icons.done,
                              color: AppColors.iconButtonColor.value,
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
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        DetailsTab(),
                        IngredientsTab(),
                        InstructionsTab()
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
