import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/models/ingredient.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/ingredients_screen/ingredient_dialog.dart';

class IngredientCard extends StatelessWidget {
  final Rx<Ingredient> ingredient;
  final int index;

  const IngredientCard({
    Key? key,
    required this.ingredient,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: InkWell(
        onTap: () {
          recipeController.setIngredient(ingredient.value);
          showDialog(
              context: context,
              builder: (context) => IngredientDialog(
                    title: 'Edit Ingredient',
                    deleteable: true,
                    index: index,
                  ));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .025,
            vertical: MediaQuery.of(context).size.height * .025,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .025,
            ),
            child: Row(
              children: [
                Text(ingredient.value.displayIngredient()),
                const Spacer(),
                Text(ingredient.value.tag),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
