import 'package:flutter/material.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_screen/details_tab/recipe_tag_chip.dart';

class RecipeTagRow extends StatelessWidget {
  final List<String> tags;
  final bool deletable;

  const RecipeTagRow({
    Key? key,
    required this.tags,
    this.deletable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        primary: true,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            children: tags
                .map((tag) => RecipeTagChip(
                      label: tag,
                      deletable: deletable,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
