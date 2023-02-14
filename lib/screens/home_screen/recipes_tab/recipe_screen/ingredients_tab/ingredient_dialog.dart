import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/recipe_outline_text_field.dart';

class IngredientDialog extends StatefulWidget {
  final String title;
  final int? index;
  final bool editing;
  final bool deleteable;
  final bool clearable;

  const IngredientDialog({
    Key? key,
    required this.title,
    this.index,
    this.editing = false,
    this.deleteable = false,
    this.clearable = false,
  }) : super(key: key);

  @override
  State<IngredientDialog> createState() => _IngredientDialogState();
}

class _IngredientDialogState extends State<IngredientDialog> {
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
    return Obx(
      (() => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AlertDialog(
                title: SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Text(widget.title),
                      const Spacer(),
                      SizedBox(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close),
                        ),
                      )
                    ],
                  ),
                ),
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
                        focusNode: myFocusNode,
                        hintText: 'ex: Onion',
                        controller: recipeController.ingredientNameController,
                        autoFocus: true,
                      ),
                      RecipeOutlinedTextField(
                        fieldKey: const ValueKey('IngredientQuantity'),
                        label: 'Quantity',
                        hintText: 'ex: 200g',
                        controller:
                            recipeController.ingredientQuantityController,
                      ),
                      RecipeOutlinedTextField(
                        fieldKey: const ValueKey('IngredientTag'),
                        label: 'Tag',
                        hintText: 'ex: Veggie',
                        inputAction: TextInputAction.done,
                        controller: recipeController.ingredientTagController,
                        onSubmitted: (value) {
                          bool ingredientAdded = recipeController.addIngredient(
                              index: widget.index);
                          if (ingredientAdded) {
                            if (widget.editing) {
                              Navigator.of(context).pop();
                            } else {
                              myFocusNode.requestFocus();
                            }
                          }
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .0125),
                      if (recipeController.ingredientWarningList.isNotEmpty)
                        Obx(
                          () => Text(
                            recipeController.ingredientWarningList.join('\n'),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.red),
                          ),
                        ),
                      if (recipeController.successString.isNotEmpty)
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(recipeController.successString.value),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      .0125),
                              const Icon(Icons.check_circle_outline_outlined)
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
