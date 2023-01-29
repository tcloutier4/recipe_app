import 'package:flutter/material.dart';
import 'package:recipe_app/controllers/controllers.dart';

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
      deleteIcon: const Icon(Icons.cancel_outlined),
      onDeleted: () {
        recipeController.currentTags.removeWhere((tag) => tag == label);
        recipeController.recipe.value.tags.removeWhere((tag) => tag == label);
      },
    );
  }
}
