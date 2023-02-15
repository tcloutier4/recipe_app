import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/instructions_tab/instruction_dialog.dart';
import 'package:recipe_app/shared/app_colors.dart';
import 'package:recipe_app/widgets/custom_card.dart';

class InstructionCard extends StatelessWidget {
  final RxString instruction;
  final int index;
  final bool viewMode;

  const InstructionCard({
    Key? key,
    required this.instruction,
    this.viewMode = false,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxBool completed = false.obs;
    return CustomCard(
      onTap: () {
        if (viewMode) {
          completed.value = !completed.value;
        } else {
          recipeController.editInstructionController.text = instruction.value;
          showDialog(
              context: context,
              builder: (context) => InstructionDialog(
                    index: index,
                  ));
        }
      },
      child: Row(
        children: [
          Column(
            children: [
              Text((index + 1).toString()),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .05,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    child: Obx(
                  (() => Text(
                        instruction.value,
                        style: completed.value
                            ? const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey)
                            : null,
                      )),
                ))
              ],
            ),
          ),
          if (viewMode)
            Obx(
              (() => Checkbox(
                    value: completed.value,
                    onChanged: null,
                    checkColor: AppColors.iconButtonColor.value,
                  )),
            )
        ],
      ),
    );
  }
}
