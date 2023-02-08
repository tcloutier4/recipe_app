import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipe_screen/add_recipe_screen/add_recipe_outline_text_field.dart';
import 'package:recipe_app/screens/home_screen/recipe_screen/add_recipe_screen/recipe_tag_row.dart';

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
    return Column(
      children: [
        AddRecipeOutlinedTextField(
          fieldKey: const ValueKey('RecipeTitle'),
          label: 'Recipe title',
          controller: recipeController.titleController,
          onSubmitted: (value) {
            recipeController.recipe.value.title = value ?? 'Missing title';
          },
        ),
        AddRecipeOutlinedTextField(
          fieldKey: const ValueKey('RecipeCookTime'),
          label: 'Time to cook (minutes)',
          textAllowed: false,
          controller: recipeController.timeController,
          onSubmitted: (value) {
            if (value != null && value.isNotEmpty) {
              recipeController.recipe.value.time = int.parse(value);
            } else {
              recipeController.recipe.value.time = 0;
            }
          },
        ),
        AddRecipeOutlinedTextField(
          fieldKey: const ValueKey('RecipeTags'),
          label: 'Recipe tags',
          controller: recipeController.tagController,
          onSubmitted: (value) {
            if (value != null && value.isNotEmpty) {
              if (!recipeController.currentTags.contains(value)) {
                recipeController.recipe.value.tags.add(value);
                recipeController.currentTags.add(value);
                recipeController.tagController.clear();
              }
            }
          },
        ),
        Obx(
          (() => Row(
                children: [
                  recipeController.currentTags.isNotEmpty
                      ? RecipeTagRow(tags: recipeController.currentTags)
                      : const SizedBox.shrink(),
                ],
              )),
        ),
        Obx(
          () => Text(
            (recipeController.hasChanges()).toString(),
          ),
        ),
      ],
    );
  }
}
