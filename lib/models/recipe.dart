import 'dart:convert';

import 'ingredient.dart';

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
  List<Ingredient> ingredients = [];
  List<String> instructions = [];
  int rating;
  int servings;
  List<String> tags = [];

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
    List<Ingredient>? ingredients,
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
    return "Recipe --> id: $id title: $title time: $time ingredients: $ingredients instructions: $instructions rating: $rating servings: $servings tags: $tags";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Recipe &&
        other.id == id &&
        other.title == title &&
        other.time == time &&
        other.ingredients == ingredients &&
        other.instructions == instructions &&
        other.rating == rating &&
        other.servings == servings &&
        other.tags == tags;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        time.hashCode ^
        ingredients.hashCode ^
        instructions.hashCode ^
        rating.hashCode ^
        servings.hashCode ^
        tags.hashCode;
  }

  bool isEmpty() {
    return id == null &&
        title == 'Missing recipe title' &&
        time == 0 &&
        ingredients.isEmpty &&
        instructions.isEmpty &&
        rating == 0 &&
        servings == 0 &&
        tags.isEmpty;
  }
}
