import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/recipe_outline_text_field.dart';

class IngredientDialog extends StatefulWidget {
  final String title;
  final int? index;
  final bool deleteable;
  final bool clearable;

  const IngredientDialog({
    Key? key,
    required this.title,
    this.index,
    this.deleteable = false,
    this.clearable = false,
  }) : super(key: key);

  @override
  State<IngredientDialog> createState() => _IngredientDialogState();
}

class _IngredientDialogState extends State<IngredientDialog> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => AlertDialog(
            title: Text(widget.title),
            actions: [
              if (widget.clearable)
                TextButton(
                  child: const Text('CLEAR'),
                  onPressed: () {
                    recipeController.resetIngredient();
                  },
                ),
              TextButton(
                child: const Text('SUBMIT'),
                onPressed: () {
                  bool ingredientAdded =
                      recipeController.addIngredient(index: widget.index);
                  if (ingredientAdded) {
                    Navigator.of(context).pop();
                  }
                },
              ),
              if (widget.deleteable)
                TextButton(
                  child: const Text(
                    'DELETE',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    recipeController.deleteIngredient(index: widget.index!);
                    Navigator.of(context).pop();
                  },
                )
            ],
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RecipeOutlinedTextField(
                    fieldKey: const ValueKey('IngredientName'),
                    label: 'Ingredient Name',
                    hintText: 'ex: Onion',
                    controller: recipeController.ingredientNameController,
                    autoFocus: true,
                  ),
                  RecipeOutlinedTextField(
                    fieldKey: const ValueKey('IngredientQuantity'),
                    label: 'Quantity',
                    hintText: 'ex: 200g',
                    controller: recipeController.ingredientQuantityController,
                  ),
                  RecipeOutlinedTextField(
                    fieldKey: const ValueKey('IngredientTag'),
                    label: 'Tag',
                    hintText: 'ex: Veggie',
                    inputAction: TextInputAction.done,
                    controller: recipeController.ingredientTagController,
                    onSubmitted: (value) {
                      bool ingredientAdded =
                          recipeController.addIngredient(index: widget.index);
                      if (ingredientAdded) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  if (recipeController.ingredientWarningList.isNotEmpty)
                    Obx(
                      () => Text(
                        recipeController.ingredientWarningList.join('\n'),
                        style: const TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ),
                ],
              ),
            ),
          )),
    );
  }
}
