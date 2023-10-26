import 'dart:convert';

class RecipeModel {
  String? name;
  String? ingredients;
  String? diet;
  String? description;
  String? prepTime;
  String? recipeLink;
  String? imageLink;

  RecipeModel(
      {this.description,
      this.diet,
      this.ingredients,
      this.name,
      this.prepTime,
      this.recipeLink,
      this.imageLink});

  factory RecipeModel.fromMap(Map<String, dynamic> json) {
    return RecipeModel(
        ingredients: json['ingredients'],
        name: json['name'],
        diet: json['diet'],
        description: json['description'],
        prepTime: json['prep_time'],
        imageLink: json['image_link'],
        recipeLink: json['recipe_link']);
  }

  static List<RecipeModel> decodeRecipe(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<RecipeModel>((json) => RecipeModel.fromMap(json))
        .toList();
  }
}

List<RecipeModel> demoRecipes = [
  RecipeModel(
      description: "Nice african dish with great nutritional value",
      name: "Plantain and beans",
      diet: "vegetarian",
      ingredients: "yam banku pepper"),
  RecipeModel(
      description: "Nice african dish with great nutritional value",
      name: "Plantain and beans",
      diet: "vegetarian",
      ingredients: "yam banku pepper"),
  RecipeModel(
      description: "Nice african dish with great nutritional value",
      name: "Plantain and beans",
      diet: "vegetarian",
      ingredients: "yam banku pepper"),
  RecipeModel(
      description: "Nice african dish with great nutritional value",
      name: "Plantain and beans",
      diet: "vegetarian",
      ingredients: "yam banku pepper"),
  RecipeModel(
      description: "Nice african dish with great nutritional value",
      name: "Plantain and beans",
      diet: "vegetarian",
      ingredients: "yam banku pepper"),
  RecipeModel(
      description: "Nice african dish with great nutritional value",
      name: "Plantain and beans",
      diet: "vegetarian",
      ingredients: "yam banku pepper")
];
