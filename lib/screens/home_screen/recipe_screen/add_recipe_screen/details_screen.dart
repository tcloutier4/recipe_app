import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipe_screen/add_recipe_screen/add_recipe_outline_text_field.dart';
import 'package:recipe_app/screens/home_screen/recipe_screen/add_recipe_screen/recipe_tag_row.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddRecipeOutlinedTextField(
          fieldKey: const ValueKey('RecipeTitle'),
          label: 'Recipe name',
          hintText: "ex: Steve's BBQ Chicken",
          controller: recipeController.titleController,
          onChanged: (value) {
            recipeController.recipe.value.title = value ?? 'Missing title';
          },
        ),
        AddRecipeOutlinedTextField(
          fieldKey: const ValueKey('RecipeCookTime'),
          label: 'Cook time',
          hintText: 'ex: 45',
          textAllowed: false,
          controller: recipeController.timeController,
          onChanged: (value) {
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
          hintText: 'ex: Lunch, Vegan, Chicken or Steve',
          dismissKeyboard: false,
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
          (() => recipeController.currentTags.isNotEmpty
              ? RecipeTagRow(tags: recipeController.currentTags)
              : const SizedBox.shrink()),
        ),
        //TODO: Test this after done everything and remove it
        Obx(
          () => Text(
            (recipeController.hasChanges()).toString(),
          ),
        ),
      ],
    );
  }
}
