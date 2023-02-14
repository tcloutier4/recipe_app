import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/details_tab/recipe_tag_row.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/ingredients_tab/ingredient_card.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/view_recipe_screen/change_servings_dialog.dart';
import 'package:recipe_app/widgets/custom_card.dart';
import 'package:recipe_app/widgets/custom_divider.dart';

class ViewIngredientsTab extends StatefulWidget {
  const ViewIngredientsTab({Key? key}) : super(key: key);

  @override
  State<ViewIngredientsTab> createState() => _ViewIngredientsTabState();
}

class _ViewIngredientsTabState extends State<ViewIngredientsTab> {
  late FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            CustomCard(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .03,
                width: MediaQuery.of(context).size.width * .35,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.swap_vert_circle_outlined),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => const ChangeServingsDialog());
                      },
                    ),
                    Obx(
                      (() => Text(' ' +
                          viewRecipeController.displayServings.value
                              .toString() +
                          ' servings')),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            CustomCard(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .03,
                width: MediaQuery.of(context).size.width * .35,
                child: Center(
                  child: Text(' ' +
                      viewRecipeController.recipe.value.time.toString() +
                      ' minutes'),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
        RecipeTagRow(
          tags: viewRecipeController.recipe.value.tags,
          deletable: false,
        ),
        const CustomDivider(
          text: 'Ingredients',
        ),
        Obx(
          (() => SizedBox(
                height: MediaQuery.of(context).size.height * .47,
                child: ListView.builder(
                  itemCount: viewRecipeController.displayIngredients.length,
                  itemBuilder: (context, index) {
                    return IngredientCard(
                      index: index,
                      editable: false,
                      ingredient:
                          viewRecipeController.displayIngredients[index].obs,
                      key: ValueKey('ViewIngredient$index'),
                    );
                  },
                ),
              )),
        ),
      ],
    );
  }
}
