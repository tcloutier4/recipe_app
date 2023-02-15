import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/instructions_tab/instruction_card.dart';
import 'package:recipe_app/widgets/custom_divider.dart';

class ViewInstructionsTab extends StatefulWidget {
  const ViewInstructionsTab({Key? key}) : super(key: key);

  @override
  State<ViewInstructionsTab> createState() => _ViewInstructionsTabState();
}

class _ViewInstructionsTabState extends State<ViewInstructionsTab> {
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
        const CustomDivider(
          text: 'Instructions',
          padding: EdgeInsets.zero,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * .025),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: viewRecipeController.recipe.value.instructions.length,
              itemBuilder: (context, index) {
                return InstructionCard(
                  index: index,
                  viewMode: true,
                  instruction:
                      viewRecipeController.recipe.value.instructions[index].obs,
                  key: ValueKey('Instruction$index'),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
