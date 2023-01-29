import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipe_screen/add_recipe_screen/add_recipe_outline_text_field.dart';
import 'package:recipe_app/shared/constants.dart';

import '../../../../mixins/loader_mixin.dart';
import '../../../../models/recipe_model.dart';
import '../../../../shared/utility_functions.dart';

class AddRecipeScreen extends StatefulWidget {
  final Recipe? initialRecipe;
  const AddRecipeScreen({
    Key? key,
    this.initialRecipe,
  }) : super(key: key);

  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> with LoaderMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: colorBrownTeddy,
        key: const Key("AddRecipeScaffoldKey"),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leading: IconButton(
            splashRadius: 32,
            iconSize: 32,
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () async {
              formKey.currentState?.save();
              //add logic for if changes exist
              if (1 == 2) {
                await showUnsavedDataWarningDialog(
                  context,
                  () => {Navigator.of(context).pop()},
                );
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
          title: Text(
            (widget.initialRecipe != null) ? 'Update Recipe' : 'Create Recipe',
            style: const TextStyle(
              color: colorFloralWhite,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  //TODO: add functionality for add button
                },
                iconSize: 32,
                icon: const Icon(
                  Icons.add,
                ))
          ],
          backgroundColor: colorBrownTeddy,
          bottomOpacity: 0.0,
          elevation: 3.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              AddRecipeOutlinedTextField(
                fieldKey: const ValueKey('RecipeTitle'),
                label: 'Recipe title',
                onSubmitted: (value) {
                  recipeController.recipe.value.title =
                      value ?? 'Missing title';
                },
              ),
              AddRecipeOutlinedTextField(
                fieldKey: const ValueKey('RecipeCookTime'),
                label: 'Time to cook (minutes)',
                textAllowed: false,
                onSubmitted: (value) {
                  if (value != null && value.isNotEmpty) {
                    recipeController.recipe.value.time = int.parse(value);
                  } else {
                    recipeController.recipe.value.time = 0;
                  }
                },
              ),
              Row(
                children: [
                  Flexible(
                    child: AddRecipeOutlinedTextField(
                      fieldKey: const ValueKey('RecipeTags'),
                      label: 'Recipe tags',
                      onSubmitted: (value) {
                        recipeController.currentTag.value = value ?? '';
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: colorFloralWhite,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: colorBrown,
          onTap: (index) {
            if (index == 0) {
            } else {
              //make ingredients, instructions and tags a list when functionality exists
              final Map<String, dynamic> recipeContext = {};
              DatabaseReference _addRecipeRef = FirebaseDatabase.instance
                  .ref()
                  .child('Recipes')
                  .child(DateTime.now().millisecondsSinceEpoch.toString());
              _addRecipeRef.set(recipeContext);
            }
          },
          selectedFontSize: 16,
          unselectedFontSize: 16,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: colorFloralWhite,
          unselectedItemColor: colorFloralWhite,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.cancel,
              ),
              label: 'Clear',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
              ),
              label: 'Create',
            ),
          ],
        ),
      ),
    );
  }
}
