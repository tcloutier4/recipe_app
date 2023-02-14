import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/recipe_screen.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/view_recipe_screen/view_ingredients_tab.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/view_recipe_screen/view_instructions_tab.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/view_recipe_screen/view_recipe_bottom_nav_bar.dart';
import 'package:recipe_app/shared/app_colors.dart';

import '../../../../models/recipe.dart';

class ViewRecipeScreen extends StatefulWidget {
  final Recipe recipe;
  const ViewRecipeScreen({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  _ViewRecipeScreenState createState() => _ViewRecipeScreenState();
}

class _ViewRecipeScreenState extends State<ViewRecipeScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    viewRecipeController.initialize(ticker: this, currentRecipe: widget.recipe);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => DefaultTabController(
            length: 2,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              key: const Key("ViewRecipeScaffold"),
              appBar: AppBar(
                titleSpacing: 0,
                leading: IconButton(
                  splashRadius: 32,
                  iconSize: 32,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: AppColors.iconButtonColor.value,
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                ),
                title: Text(viewRecipeController.recipe.value.title),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => RecipeScreen(
                              initialRecipe:
                                  viewRecipeController.recipe.value)),
                        ),
                      );
                    },
                    iconSize: 32,
                    icon: Icon(
                      Icons.edit,
                      color: AppColors.iconButtonColor.value,
                    ),
                  )
                ],
                bottomOpacity: 0.0,
                elevation: 3.0,
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * .025,
                  horizontal: MediaQuery.of(context).size.width * .025,
                ),
                child: TabBarView(
                    controller: viewRecipeController.tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      ViewIngredientsTab(),
                      ViewInstructionsTab(),
                    ]),
              ),
              bottomNavigationBar: ViewRecipeBottomNavBar(
                const Key('RecipeNavBar'),
                viewRecipeController.tabIndex.value,
                (index) {
                  viewRecipeController.selectTab(index);
                },
              ),
            ),
          )),
    );
  }
}
