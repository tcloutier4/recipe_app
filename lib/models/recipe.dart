import 'dart:convert';
import 'package:hive/hive.dart';
import 'ingredient.dart';
part 'recipe.g.dart';

@HiveType(typeId: 0)
class Recipe extends HiveObject {
  Recipe({
    this.id = -1,
    this.title = 'Missing recipe title',
    this.time = 0,
    this.ingredients = const [],
    this.instructions = const [],
    this.rating = 0,
    this.servings = 0,
    this.tags = const [],
    this.isFavorite = false,
  });

  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  int time;
  @HiveField(3)
  List<Ingredient> ingredients = [];
  @HiveField(4)
  List<String> instructions = [];
  @HiveField(5)
  int rating;
  @HiveField(6)
  int servings;
  @HiveField(7)
  List<String> tags = [];
  @HiveField(8)
  bool isFavorite;

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
      isFavorite: json["isFavorite"],
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
        "isFavorite": isFavorite
      };

  static List<Recipe> fromStringToList(String response) {
    final List<dynamic> items = json.decode(response) as List<dynamic>;
    final List<Recipe> recipeModels = items.map((item) {
      return Recipe.fromJson(item as Map<String, dynamic>);
    }).toList();

    return recipeModels;
  }

  Recipe copyWith({
    int? id,
    String? title,
    int? time,
    List<Ingredient>? ingredients,
    List<String>? instructions,
    int? rating,
    int? servings,
    List<String>? tags,
    bool? isFavorite,
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
        isFavorite: isFavorite ?? this.isFavorite);
  }

  @override
  String toString() {
    return "Recipe --> id: $id, title: $title, time: $time, ingredients: $ingredients, instructions: $instructions, rating: $rating, servings: $servings, tags: $tags, isFavorite: $isFavorite";
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
        other.tags == tags &&
        other.isFavorite == isFavorite;
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
        tags.hashCode ^
        isFavorite.hashCode;
  }

  bool isEmpty() {
    return (title == 'Missing recipe title' || title == '') &&
        time == 0 &&
        ingredients.isEmpty &&
        instructions.isEmpty &&
        rating == 0 &&
        servings == 0 &&
        tags.isEmpty;
  }
}
