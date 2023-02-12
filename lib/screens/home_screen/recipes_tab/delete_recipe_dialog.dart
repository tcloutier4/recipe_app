import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_chip_row.dart';

class DeleteRecipeDialog extends StatefulWidget {
  const DeleteRecipeDialog({Key? key}) : super(key: key);

  @override
  State<DeleteRecipeDialog> createState() => _DeleteRecipeDialogState();
}

class _DeleteRecipeDialogState extends State<DeleteRecipeDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AlertDialog(
          title: SizedBox(
            height: MediaQuery.of(context).size.height * .03,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const Text('Delete Recipes'),
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
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .025),
              child: Row(
                children: [
                  Obx(
                    (() => TextButton(
                          child: Text(
                            'DELETE',
                            style: TextStyle(
                              color: homeController.recipesChecked.isEmpty
                                  ? Colors.grey[700]
                                  : Colors.red,
                            ),
                          ),
                          onPressed: homeController.recipesChecked.isEmpty
                              ? null
                              : () {
                                  homeController.deleteSelectedRecipes();
                                  Navigator.of(context).pop();
                                },
                        )),
                  ),
                  const Spacer(),
                  TextButton(
                    child: const Text('CANCEL'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            )
          ],
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Are you sure you want to delete the following recipes?',
                textAlign: TextAlign.center,
              ),
              Obx(
                (() => homeController.recipesChecked.isNotEmpty
                    ? RecipeChipRow(
                        recipesChecked: homeController.recipesChecked)
                    : const SizedBox.shrink()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
