import 'dart:convert';

import 'ingredient_model.dart';

RecipesModel recipesModelFromJson(String str) =>
    RecipesModel.fromJson(json.decode(str) as Map<String, dynamic>);

String recipesModelToJson(RecipesModel data) => json.encode(data.toJson());

class RecipesModel {
  RecipesModel({
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

  factory RecipesModel.fromJson(Map<String, dynamic> json) {
    return RecipesModel(
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

  static List<RecipesModel> fromStringToList(String response) {
    final List<dynamic> items = json.decode(response) as List<dynamic>;
    final List<RecipesModel> recipeModels = items.map((item) {
      return RecipesModel.fromJson(item as Map<String, dynamic>);
    }).toList();

    return recipeModels;
  }

  RecipesModel copyWith({
    String? id,
    String? title,
    int? time,
    List<IngredientsModel>? ingredients,
    List<String>? instructions,
    int? rating,
    int? servings,
    List<String>? tags,
  }) {
    return RecipesModel(
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
    return "$id\n$title\n$time\n$ingredients\n$instructions\n$rating\n$servings\n$tags";
  }
}
