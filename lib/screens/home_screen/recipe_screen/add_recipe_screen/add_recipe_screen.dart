import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: colorBrownTeddy,
      key: const Key("AddRecipeScaffoldKey"),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          children: <Widget>[
            IconButton(
              splashRadius: 20,
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
            const Spacer(flex: 1),
            Text(
              (widget.initialRecipe != null)
                  ? 'Update Recipe'
                  : 'Create Recipe',
              style: const TextStyle(
                color: colorFloralWhite,
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
        backgroundColor: colorBrownTeddy,
        bottomOpacity: 0.0,
        elevation: 3.0,
      ),
      body: const Text('hey'),
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
    );
  }
}
