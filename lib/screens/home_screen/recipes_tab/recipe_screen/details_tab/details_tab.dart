import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/recipe_outline_text_field.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/details_tab/recipe_tag_row.dart';
import 'package:recipe_app/widgets/custom_divider.dart';

class DetailsTab extends StatefulWidget {
  const DetailsTab({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsTab> createState() => _DetailsTabState();
}

class _DetailsTabState extends State<DetailsTab> {
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
        RecipeOutlinedTextField(
          fieldKey: const ValueKey('RecipeTitle'),
          label: 'Recipe name',
          hintText: "ex: Steve's BBQ Chicken",
          controller: recipeController.titleController,
          onSubmitted: (value) {
            recipeController.recipe.value.title = value ?? 'Missing title';
          },
        ),
        RecipeOutlinedTextField(
          fieldKey: const ValueKey('RecipeCookTime'),
          label: 'Cook time',
          hintText: 'ex: 45',
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
        RecipeOutlinedTextField(
          fieldKey: const ValueKey('RecipeTags'),
          label: 'Recipe tags',
          hintText: 'ex: Lunch, Vegan, Chicken or Steve',
          controller: recipeController.tagController,
          focusNode: myFocusNode,
          onSubmitted: (value) {
            if (value != null && value.isNotEmpty) {
              if (!recipeController.currentTags.contains(value)) {
                recipeController.recipe.value.tags.add(value);
                recipeController.currentTags.add(value);
                recipeController.tagController.clear();
              }
            }
            myFocusNode.requestFocus();
          },
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .025),
          child: const CustomDivider(
            text: 'Tags',
          ),
        ),
        Obx(
          (() => recipeController.currentTags.isNotEmpty
              ? RecipeTagRow(tags: recipeController.currentTags)
              : const SizedBox.shrink()),
        ),
      ],
    );
  }
}
