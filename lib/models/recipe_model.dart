import 'dart:convert';

import 'ingredient_model.dart';

Recipe recipesModelFromJson(String str) =>
    Recipe.fromJson(json.decode(str) as Map<String, dynamic>);

String recipesModelToJson(Recipe data) => json.encode(data.toJson());

class Recipe {
  Recipe({
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

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json["id"] as String,
      title: json["title"] as String,
      time: json["time"] as int,
      ingredients: json["ingredients"] as List<IngredientsModel>,
      instructions: json["instructions"] as List<String>,
      rating: json["rating"] as int,
      servings: json["servings"] as int,
      tags: json["tags"] as List<String>,
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
