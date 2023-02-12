import 'package:flutter/material.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/shared/app_colors.dart';

class RecipeChip extends StatelessWidget {
  final Recipe recipe;

  const RecipeChip({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(recipe.title),
      deleteIcon: Icon(
        Icons.cancel_outlined,
        color: AppColors.iconButtonColor.value,
      ),
      onDeleted: () {
        homeController.recipesChecked.remove(recipe);
      },
    );
  }
}
