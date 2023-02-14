import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/models/ingredient.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/ingredients_tab/ingredient_dialog.dart';
import 'package:recipe_app/widgets/custom_card.dart';

class IngredientCard extends StatelessWidget {
  final Rx<Ingredient> ingredient;
  final bool editable;
  final int index;

  const IngredientCard({
    Key? key,
    required this.ingredient,
    this.editable = true,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        child: Obx(
          (() => Row(
                children: [
                  Text(ingredient.value.displayIngredient()),
                  const Spacer(),
                  Text(ingredient.value.tag),
                ],
              )),
        ),
        onTap: editable
            ? () {
                recipeController.setIngredient(ingredient.value);
                showDialog(
                  context: context,
                  builder: (context) => IngredientDialog(
                    title: 'Edit Ingredient',
                    deleteable: true,
                    editing: true,
                    index: index,
                  ),
                );
              }
            : null);
  }
}
