import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/recipe_model.dart';
import '../screens/recipe_details_screen/recipe_details_screen.dart';

class RelatedRecipeCard extends StatelessWidget {
  const RelatedRecipeCard({
    super.key,
    required this.recipe,
    required this.others,
  });
  final RecipeModel recipe;
  final List<RecipeModel> others;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => RecipeDetailsScreen(
              recipe: recipe,
              others: others,
            ),
          ),
        );
      },
      child: Container(
        height: 80,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.hardEdge,
        child: CachedNetworkImage(
          imageUrl: recipe.imageLink!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
