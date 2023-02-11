import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/recipe_outline_text_field.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/ingredients_screen/ingredient_card.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/ingredients_screen/ingredient_dialog.dart';
import 'package:recipe_app/widgets/custom_divider.dart';

class InstructionsScreen extends StatefulWidget {
  const InstructionsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<InstructionsScreen> createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .025),
                child: const CustomDivider(
                  text: 'Ingredients',
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .025),
                  child: ReorderableListView.builder(
                    shrinkWrap: true,
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
                child: const Text('Add Instruction'),
              ),
            ],
          )),
    );
  }
}
