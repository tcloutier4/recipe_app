import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/recipe_outline_text_field.dart';

class ChangeServingsDialog extends StatefulWidget {
  const ChangeServingsDialog({Key? key}) : super(key: key);

  @override
  State<ChangeServingsDialog> createState() => _ChangeServingsDialogState();
}

class _ChangeServingsDialogState extends State<ChangeServingsDialog> {
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
                const Text('Change Servings'),
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: const Text('CANCEL'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('SUBMIT'),
                    onPressed: viewRecipeController.servingsWarning.isNotEmpty
                        ? () {
                            //
                            if (viewRecipeController
                                .editServingsController.text.isNotEmpty) {
                              viewRecipeController.editServings(int.parse(
                                  viewRecipeController
                                      .editServingsController.text));
                              Navigator.of(context).pop();
                            } else {
                              viewRecipeController.servingsWarning.value =
                                  'Requires at least 1 serving';
                            }
                          }
                        : null,
                  ),
                ],
              ),
            )
          ],
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Changing servings will edit the amount of ingredients required while on this page',
                textAlign: TextAlign.center,
              ),
              RecipeOutlinedTextField(
                fieldKey: const ValueKey('Servings'),
                label: 'Servings',
                hintText: 'ex: 5',
                autoFocus: true,
                textAllowed: false,
                inputAction: TextInputAction.done,
                controller: viewRecipeController.editServingsController,
                onChanged: (value) {
                  if (value != null && value.isNotEmpty) {
                    viewRecipeController.servingsWarning.value = '';
                  }
                },
                onSubmitted: (value) {
                  if (value != null && value.isNotEmpty) {
                    viewRecipeController.editServings(int.parse(value));
                    Navigator.of(context).pop();
                  } else {
                    viewRecipeController.servingsWarning.value =
                        'Requires at least 1 serving';
                  }
                },
              ),
              if (viewRecipeController.servingsWarning.isNotEmpty)
                Obx(
                  (() => Text(
                        viewRecipeController.servingsWarning.value,
                        style: const TextStyle(fontSize: 16, color: Colors.red),
                      )),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
