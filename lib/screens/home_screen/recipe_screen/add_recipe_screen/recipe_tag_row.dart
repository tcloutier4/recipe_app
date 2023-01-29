import 'package:flutter/material.dart';
import 'package:recipe_app/screens/home_screen/recipe_screen/add_recipe_screen/recipe_tag_chip.dart';

class RecipeTagRow extends StatelessWidget {
  final List<String> tags;

  const RecipeTagRow({
    Key? key,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * .13,
            width: MediaQuery.of(context).size.width * .9,
            child: ListView(
              primary: true,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Wrap(
                  spacing: 4,
                  children:
                      tags.map((tag) => RecipeTagChip(label: tag)).toList(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
