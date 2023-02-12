import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/instructions_screen/instruction_dialog.dart';

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
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: InkWell(
        onTap: () {
          recipeController.editInstructionController.text = instruction.value;
          showDialog(
              context: context,
              builder: (context) => InstructionDialog(
                    index: index,
                  ));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .025,
            vertical: MediaQuery.of(context).size.height * .025,
          ),
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
                      width: MediaQuery.of(context).size.width * .8,
                      child: Text(instruction.value))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
