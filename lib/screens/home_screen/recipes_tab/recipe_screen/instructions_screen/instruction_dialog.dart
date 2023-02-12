import 'package:flutter/material.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/recipe_outline_text_field.dart';

class InstructionDialog extends StatefulWidget {
  final int index;

  const InstructionDialog({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<InstructionDialog> createState() => _InstructionDialogState();
}

class _InstructionDialogState extends State<InstructionDialog> {
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
                const Text('Edit Instruction'),
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
                  TextButton(
                    child: const Text(
                      'DELETE',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      recipeController.deleteInstruction(index: widget.index);
                      recipeController.recipe.refresh();
                      Navigator.of(context).pop();
                    },
                  ),
                  const Spacer(),
                  TextButton(
                    child: const Text('CLEAR'),
                    onPressed: () {
                      recipeController.editInstructionController.clear();
                    },
                  ),
                  TextButton(
                    child: const Text('SUBMIT'),
                    onPressed: () {
                      recipeController.recipe.value.instructions[widget.index] =
                          recipeController.editInstructionController.text;
                      recipeController.recipe.refresh();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            )
          ],
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RecipeOutlinedTextField(
                  fieldKey: const ValueKey('Instruction'),
                  height: 10,
                  label: 'Instruction',
                  autoFocus: true,
                  hintText: 'Insert new instruction #${widget.index + 1}',
                  controller: recipeController.editInstructionController,
                  onSubmitted: (value) {
                    recipeController.recipe.value.instructions[widget.index] =
                        recipeController.editInstructionController.text;
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
