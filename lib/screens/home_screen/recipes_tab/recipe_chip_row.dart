import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/recipe_chip.dart';

class RecipeChipRow extends StatelessWidget {
  final List<Recipe> recipesChecked;

  const RecipeChipRow({
    Key? key,
    required this.recipesChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: MediaQuery.of(context).size.width * .33,
        width: MediaQuery.of(context).size.width * .9,
        child: ListView(
          primary: true,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Wrap(
              children: recipesChecked
                  .map((recipe) => RecipeChip(recipe: recipe))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
