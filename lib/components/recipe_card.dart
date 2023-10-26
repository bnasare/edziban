import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/recipe_model.dart';
import '../screens/recipe_details_screen/recipe_details_screen.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.recipe,
    required this.others,
  });
  final RecipeModel recipe;
  final List<RecipeModel> others;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 100,
            decoration: BoxDecoration(
              // color: Colors.white,
              // image: DecorationImage(image: AssetImage(plantain)),
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.hardEdge,
            child: CachedNetworkImage(
              imageUrl: recipe.imageLink!,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    recipe.name!,
                    softWrap: false,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
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
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green),
                      ),
                      child: const Center(
                        child: Text(
                          "See more",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
