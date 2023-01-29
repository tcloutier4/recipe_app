import 'dart:convert';

import 'ingredient_model.dart';

Recipe recipesModelFromJson(String str) =>
    Recipe.fromJson(json.decode(str) as Map<String, dynamic>);

String recipesModelToJson(Recipe data) => json.encode(data.toJson());

class Recipe {
  Recipe({
    this.id,
    this.title = 'Missing recipe title',
    this.time = 0,
    this.ingredients = const [],
    this.instructions = const [],
    this.rating = 0,
    this.servings = 0,
    this.tags = const [],
  });

  String? id;
  String title;
  int time;
  List<IngredientsModel> ingredients;
  List<String> instructions;
  int rating;
  int servings;
  List<String> tags;

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json["id"],
      title: json["title"],
      time: json["time"],
      ingredients: json["ingredients"],
      instructions: json["instructions"],
      rating: json["rating"],
      servings: json["servings"],
      tags: json["tags"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "time": time,
        "ingredients": ingredients,
        "instructions": instructions,
        "rating": rating,
        "servings": servings,
        "tags": tags,
      };

  static List<Recipe> fromStringToList(String response) {
    final List<dynamic> items = json.decode(response) as List<dynamic>;
    final List<Recipe> recipeModels = items.map((item) {
      return Recipe.fromJson(item as Map<String, dynamic>);
    }).toList();

    return recipeModels;
  }

  Recipe copyWith({
    String? id,
    String? title,
    int? time,
    List<IngredientsModel>? ingredients,
    List<String>? instructions,
    int? rating,
    int? servings,
    List<String>? tags,
  }) {
    return Recipe(
      id: id ?? this.id,
      title: title ?? this.title,
      time: time ?? this.time,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
      rating: rating ?? this.rating,
      servings: servings ?? this.servings,
      tags: tags ?? this.tags,
    );
  }

  @override
  String toString() {
    return "id: $id\n title: $title\ntime: $time\ningredients: $ingredients\ninstructions: $instructions\nrating: $rating\nservings: $servings\ntags: $tags";
  }
}
