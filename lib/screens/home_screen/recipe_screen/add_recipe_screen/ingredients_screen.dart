import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipe_screen/add_recipe_screen/add_recipe_outline_text_field.dart';
import 'package:recipe_app/widgets/custom_divider.dart';

class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => Column(
            children: [
              AddRecipeOutlinedTextField(
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
                  text: 'Add ingredients',
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: AddRecipeOutlinedTextField(
                      fieldKey: const ValueKey('IngredientName'),
                      label: 'Ingredient Name',
                      hintText: 'ex: Onion',
                      controller: recipeController.ingredientNameController,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .05,
                  ),
                  Flexible(
                    child: AddRecipeOutlinedTextField(
                      fieldKey: const ValueKey('IngredientTag'),
                      label: 'Tag',
                      hintText: 'ex: Veggie',
                      controller: recipeController.ingredientTagController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: AddRecipeOutlinedTextField(
                      fieldKey: const ValueKey('IngredientQuantity'),
                      label: 'Quantity',
                      hintText: 'ex: 200',
                      controller: recipeController.ingredientQuantityController,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .05,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  recipeController.addIngredient();
                },
                child: const Text('Add Ingredient'),
              ),
              if (recipeController.ingredientWarningList.isNotEmpty)
                Text(
                  recipeController.ingredientWarningList.join('\n'),
                  style: const TextStyle(fontSize: 16),
                ),

              // Obx(
              //   (() => Row(
              //         children: [
              //           recipeController.currentTags.isNotEmpty
              //               ? RecipeTagRow(tags: recipeController.currentTags)
              //               : const SizedBox.shrink(),
              //         ],
              //       )),
              // ),

              Text(recipeController.recipe.value.ingredients.toString()),

              Obx(
                () => Text(
                  (recipeController.hasChanges()).toString(),
                ),
              ),
            ],
          )),
    );
  }
}
