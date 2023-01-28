import 'package:flutter/material.dart';
import 'package:recipe_app/screens/home_screen/recipe_screen/add_recipe_screen/add_recipe_screen.dart';
import 'package:recipe_app/shared/constants.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({
    Key? key,
  }) : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBrownTeddy,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        backgroundColor: colorBrown,
        onPressed: () {
          //use this for reference of how to use firebase
          // DatabaseReference _testRef =
          // FirebaseDatabase.instance.ref().child('test');
          // _testRef.set('Hello world ${Random().nextInt(100)}');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const AddRecipeScreen()),
            ),
          );
        },
        tooltip: 'Create Recipe',
        child: const Icon(Icons.add, color: colorFloralWhite),
      ),
    );
  }
}
