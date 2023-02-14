import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/local/hive_storage.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/screens/home_screen/recipes_tab/view_recipe_screen/view_recipe_screen.dart';
import 'package:recipe_app/widgets/custom_card.dart';

class RecipeCard extends StatelessWidget {
  final Rx<Recipe> recipe;
  // final void Function() onTap;

  const RecipeCard({
    Key? key,
    required this.recipe,
    // this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => Row(
            children: [
              if (homeController.deleteModeEnabled.value)
                Obx(
                  (() => Checkbox(
                        value: homeController.recipesChecked
                            .contains(recipe.value),
                        onChanged: (value) {
                          if (value!) {
                            homeController.recipesChecked.add(recipe.value);
                          } else {
                            homeController.recipesChecked.remove(recipe.value);
                          }
                        },
                      )),
                ),
              Flexible(
                child: CustomCard(
                  onLongPress: () {
                    homeController.recipesChecked.clear();

                    homeController.deleteModeEnabled.value =
                        !homeController.deleteModeEnabled.value;
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) =>
                            ViewRecipeScreen(recipe: recipe.value)),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                recipe.value.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.timelapse,
                                size: 16,
                              ),
                              Text(' ${recipe.value.time.toString()} '),
                              const Icon(
                                Icons.label_outline,
                                size: 20,
                              ),
                              recipe.value.tags.isEmpty
                                  ? const SizedBox.shrink()
                                  : Text(
                                      '${recipe.value.tags[0]}${recipe.value.tags.length > 1 ? '+ ${recipe.value.tags.length - 1} more' : ''}')
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Obx(
                        (() => SizedBox(
                              height: MediaQuery.of(context).size.height * .025,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  recipe.value.isFavorite =
                                      !recipe.value.isFavorite;
                                  HiveStorage.update(
                                      key: recipe.value.id,
                                      data: recipe.value,
                                      box: 'recipes');
                                  homeController.getRecipes();
                                },
                                icon: (recipe.value.isFavorite)
                                    ? const Icon(Icons.favorite)
                                    : const Icon(Icons.favorite_border),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
