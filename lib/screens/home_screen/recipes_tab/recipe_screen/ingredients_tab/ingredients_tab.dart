import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/recipe_outline_text_field.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/ingredients_tab/ingredient_card.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/ingredients_tab/ingredient_dialog.dart';
import 'package:recipe_app/widgets/custom_divider.dart';

class IngredientsTab extends StatefulWidget {
  const IngredientsTab({
    Key? key,
  }) : super(key: key);

  @override
  State<IngredientsTab> createState() => _IngredientsTabState();
}

class _IngredientsTabState extends State<IngredientsTab> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => Column(
            children: [
              RecipeOutlinedTextField(
                fieldKey: const ValueKey('Servings'),
                label: 'Servings',
                hintText: 'ex: 5',
                textAllowed: false,
                controller: recipeController.servingsController,
                onChanged: (value) {
                  if (value != null && value.isNotEmpty) {
                    recipeController.recipe.value.servings = int.parse(value);
                  } else {
                    recipeController.recipe.value.servings = 0;
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .025),
                child: const CustomDivider(
                  text: 'Ingredients',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .025),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .52,
                  child: ReorderableListView.builder(
                    onReorder: (oldIndex, newIndex) {
                      if (newIndex > oldIndex) {
                        newIndex--;
                      }
                      final ingredient = recipeController
                          .recipe.value.ingredients
                          .removeAt(oldIndex);
                      recipeController.recipe.value.ingredients
                          .insert(newIndex, ingredient);
                    },
                    itemCount: recipeController.recipe.value.ingredients.length,
                    itemBuilder: (context, index) {
                      return IngredientCard(
                        index: index,
                        ingredient: recipeController
                            .recipe.value.ingredients[index].obs,
                        key: ValueKey('Ingredient$index'),
                      );
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const IngredientDialog(
                            title: 'Add Ingredient',
                            clearable: true,
                          ));
                },
                child: const Text('Add Ingredient'),
              ),
            ],
          )),
    );
  }
}
