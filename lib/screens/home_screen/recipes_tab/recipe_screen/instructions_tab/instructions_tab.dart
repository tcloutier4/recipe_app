import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/instructions_tab/instruction_card.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/recipe_outline_text_field.dart';
import 'package:recipe_app/widgets/custom_divider.dart';

class InstructionsTab extends StatefulWidget {
  const InstructionsTab({
    Key? key,
  }) : super(key: key);

  @override
  State<InstructionsTab> createState() => _InstructionsTabState();
}

class _InstructionsTabState extends State<InstructionsTab> {
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
            children: [
              RecipeOutlinedTextField(
                fieldKey: const ValueKey('Instruction'),
                focusNode: myFocusNode,
                label: 'Instructions',
                hintText: 'Add next instruction',
                controller: recipeController.instructionController,
                onSubmitted: (value) {
                  myFocusNode.requestFocus();
                  if (recipeController.instructionController.text.isNotEmpty) {
                    recipeController.recipe.value.instructions
                        .add(recipeController.instructionController.text);
                    recipeController.instructionController.clear();
                    recipeController.recipe.refresh();
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .025),
                child: const CustomDivider(
                  text: 'Instructions',
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .025),
                  child: ReorderableListView.builder(
                    shrinkWrap: true,
                    onReorder: (oldIndex, newIndex) {
                      if (newIndex > oldIndex) {
                        newIndex--;
                      }
                      final instruction = recipeController
                          .recipe.value.instructions
                          .removeAt(oldIndex);
                      recipeController.recipe.value.instructions
                          .insert(newIndex, instruction);
                    },
                    itemCount:
                        recipeController.recipe.value.instructions.length,
                    itemBuilder: (context, index) {
                      return InstructionCard(
                        index: index,
                        instruction: recipeController
                            .recipe.value.instructions[index].obs,
                        key: ValueKey('Instruction$index'),
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
