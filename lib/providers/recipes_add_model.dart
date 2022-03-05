import 'package:flutter/cupertino.dart';

import '../models/ingredient_model.dart';
import '../models/recipe_model.dart';

class RecipesAddModel extends ChangeNotifier {
  RecipesAddModel({
    this.id,
    this.title,
    this.time,
    this.ingredients,
    this.instructions,
    this.rating,
    this.servings,
    this.tags,
  });

  String? id;

  String? title;
  int? time;
  List<IngredientsModel>? ingredients;
  List<String>? instructions;
  int? rating;
  int? servings;
  List<String>? tags;

  RecipesAddModel.fromRecipesAddModel({required RecipesModel model}) {
    id = model.id;
    title = model.title;
    time = model.time;
    ingredients = model.ingredients;
    instructions = model.instructions;
    rating = model.rating;
    servings = model.servings;
    tags = model.tags;
  }

  void onChange() {
    notifyListeners();
  }

  void setId(String id) {
    this.id = id;
    notifyListeners();
  }

  void setTitle(String title) {
    this.title = title;
    notifyListeners();
  }

  void setTime(int time) {
    this.time = time;
    notifyListeners();
  }

  void setIngredients(List<IngredientsModel> ingredients) {
    this.ingredients = ingredients;
    notifyListeners();
  }

  void setInstructions(List<String> instructions) {
    this.instructions = instructions;
    notifyListeners();
  }

  void setRating(int rating) {
    this.rating = rating;
    notifyListeners();
  }

  void setServings(int servings) {
    this.servings = servings;
    notifyListeners();
  }

  void setTags(List<String> tags) {
    this.tags = tags;
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'time': time,
      'ingredients': ingredients,
      'instructions': instructions,
      'rating': rating,
      'servings': servings,
      'tags': tags,
    };
  }
}
