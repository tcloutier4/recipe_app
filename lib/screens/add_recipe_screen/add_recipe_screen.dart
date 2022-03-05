import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/providers/recipes_add_model.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/screens/add_recipe_screen/add_recipe_outline_text_field.dart';
import 'package:recipe_app/shared/constants.dart';

import '../../mixins/loader_mixin.dart';
import '../../models/recipe_model.dart';
import '../../shared/utility_functions.dart';

RecipesModel _recipesModel = RecipesModel();
RecipesAddModel _recipesAddModel = RecipesAddModel();

class AddRecipeScreen extends StatefulWidget {
  final RecipesModel? recipesModel;
  const AddRecipeScreen({
    Key? key,
    this.recipesModel,
  }) : super(key: key);

  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> with LoaderMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController instructionsController = TextEditingController();
  TextEditingController servingController = TextEditingController();
  TextEditingController tagsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.recipesModel != null) {
      _recipesAddModel = RecipesAddModel.fromRecipesAddModel(
          model: widget.recipesModel as RecipesModel);
    }
  }

  @override
  void dispose() {
    _recipesModel = RecipesModel();
    _recipesAddModel = RecipesAddModel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => widget.recipesModel != null
                ? RecipesAddModel.fromRecipesAddModel(
                    model: widget.recipesModel as RecipesModel)
                : RecipesAddModel()),
      ],
      builder: (builderContext, child) => WillPopScope(
        onWillPop: () async {
          formKey.currentState?.save();

          await showUnsavedDataWarningDialog(
            context,
            () => {
              Navigator.of(context).pop(),
            },
          );

          return false;
        },
        child: Scaffold(
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

                    await showUnsavedDataWarningDialog(
                      context,
                      () => {Navigator.of(context).pop()},
                    );
                  },
                ),
                const Spacer(flex: 1),
                Text(
                  (widget.recipesModel != null)
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
          body: Form(
            key: formKey,
            child: ListView(
              key: const Key('AddRecipeListView'),
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              children: [
                AddRecipeOutlinedTextField(
                  fieldKey: const Key('RecipeNameField'),
                  label: 'Recipe Name',
                  controller: nameController,
                  onSaved: (str) {
                    _recipesAddModel.title = str;
                    _recipesAddModel.onChange();
                  },
                ),
                AddRecipeOutlinedTextField(
                  fieldKey: const Key('RecipeTimeField'),
                  label: 'Time',
                  hintText: 'Time to make (minutes)',
                  controller: timeController,
                  onSaved: (str) {
                    _recipesAddModel.title = str;
                    _recipesAddModel.onChange();
                  },
                ),
                //create ability to add a textfield with the click of a button
                //  to add a new ingredient
                AddRecipeOutlinedTextField(
                  fieldKey: const Key('RecipeIngredientField'),
                  label: 'Add Ingredient',
                  controller: ingredientsController,
                  onSaved: (str) {
                    _recipesAddModel.title = str;
                    _recipesAddModel.onChange();
                  },
                ),
                //create ability to add a textfield with the click of a button
                //  to add a new instruction
                AddRecipeOutlinedTextField(
                  fieldKey: const Key('RecipeInstructionField'),
                  label: 'Add Instruction',
                  controller: instructionsController,
                  onSaved: (str) {
                    _recipesAddModel.title = str;
                    _recipesAddModel.onChange();
                  },
                ),

                AddRecipeOutlinedTextField(
                  fieldKey: const Key('RecipeServingsField'),
                  label: 'Add Servings',
                  controller: servingController,
                  onSaved: (str) {
                    _recipesAddModel.title = str;
                    _recipesAddModel.onChange();
                  },
                ),
                AddRecipeOutlinedTextField(
                  fieldKey: const Key('RecipeTagsField'),
                  label: 'Add Tags',
                  hintText: 'Add Tags (optional)',
                  controller: tagsController,
                  onSaved: (str) {
                    _recipesAddModel.title = str;
                    _recipesAddModel.onChange();
                  },
                ),
                // const SizedBox(
                //   height: 100,
                // ),
                // OutlinedButton(
                //     key: const Key('CreateRecipeButton'),
                //     style: ButtonStyle(
                //         backgroundColor:
                //             MaterialStateProperty.all<Color>(colorBrown)),
                //     onPressed: () {},
                //     child: const Text('Create Recipe'))
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0.0,
            backgroundColor: colorBrown,
            onTap: (index) {
              if (index == 0) {
                nameController.clear();
                timeController.clear();
                ingredientsController.clear();
                instructionsController.clear();
                servingController.clear();
                tagsController.clear();
              } else {
                //make ingredients, instructions and tags a list when functionality exists
                final Map<String, dynamic> recipeContext = {
                  'Recipe Name': nameController.text,
                  'Time To Make': timeController.text,
                  'Ingredients': ingredientsController.text,
                  'Instructions': instructionsController.text,
                  'Servings': servingController.text,
                  'Tags': tagsController.text,
                };
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
      ),
    );
  }
}
