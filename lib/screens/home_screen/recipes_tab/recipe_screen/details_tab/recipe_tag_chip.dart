import 'package:flutter/material.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/shared/app_colors.dart';

class RecipeTagChip extends StatelessWidget {
  final String label;

  const RecipeTagChip({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      deleteIcon: Icon(
        Icons.cancel_outlined,
        color: AppColors.iconButtonColor.value,
      ),
      onDeleted: () {
        recipeController.currentTags.removeWhere((tag) => tag == label);
        recipeController.recipe.value.tags.removeWhere((tag) => tag == label);
      },
    );
  }
}