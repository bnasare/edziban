import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/related_recipe_card.dart';
import '../../constants/common.dart';
import '../../models/recipe_model.dart';

class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen(
      {super.key, required this.recipe, required this.others});
  final RecipeModel recipe;
  final List<RecipeModel> others;
  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.platformDefault)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("unavailble at this moment"),
                ),
              );
            },
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  _launchUrl(widget.recipe.recipeLink!);
                },
                child: Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: widget.recipe.imageLink!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        color: Colors.white.withOpacity(0.5),
                        child: const Center(
                            child: Image(image: AssetImage(youtubeLogo))),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.recipe.name!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.recipe.description!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Read More",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Related Recipes",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                  Text(
                    "",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      widget.others.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: RelatedRecipeCard(
                          recipe: widget.others[index],
                          others: widget.others,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
