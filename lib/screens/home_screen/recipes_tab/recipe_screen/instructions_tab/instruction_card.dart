import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/instructions_tab/instruction_dialog.dart';
import 'package:recipe_app/widgets/custom_card.dart';

class InstructionCard extends StatelessWidget {
  final RxString instruction;
  final int index;

  const InstructionCard({
    Key? key,
    required this.instruction,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {
        recipeController.editInstructionController.text = instruction.value;
        showDialog(
            context: context,
            builder: (context) => InstructionDialog(
                  index: index,
                ));
      },
      child: Row(
        children: [
          Column(
            children: [Text((index + 1).toString())],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .05,
          ),
          Column(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * .75,
                  child: Text(instruction.value))
            ],
          )
        ],
      ),
    );
  }
}
