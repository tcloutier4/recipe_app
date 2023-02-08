import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/screens/home_screen/recipe_screen/add_recipe_screen/add_recipe_screen.dart';
import 'package:recipe_app/screens/home_screen/recipe_screen/recipe_card.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .025,
          vertical: MediaQuery.of(context).size.height * .025,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(
              (() => homeController.recipeList.isNotEmpty
                  ? Flexible(
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Obx(
                              (() => RecipeCard(
                                  key: ValueKey('RecipeCard$index'),
                                  recipe:
                                      homeController.recipeList[index].obs)),
                            );
                          },
                          itemCount: homeController.recipeList.length),
                    )
                  : const SizedBox.shrink()),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 8,
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
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
