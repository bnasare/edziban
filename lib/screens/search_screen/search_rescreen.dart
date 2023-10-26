import 'package:flutter/material.dart';

import '../../components/recipe_card.dart';
import '../../components/search_bar.dart';
import '../../functions/functions.dart';
import '../../models/recipe_model.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key, required this.query});
  final String query;
  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  List<RecipeModel> foundRecipes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: fetchRecipe(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Error"),
                    content: const Text("Service Unavailble"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text("OK"),
                      )
                    ],
                  ),
                );
              }
            }

            foundRecipes.addAll(snapshot.data!
                .where((recipe) => recipe.ingredients!.contains(widget.query)));
            print(snapshot.data!.length);

            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SearchBarr(
                            hintText: widget.query,
                            filledColor: Colors.grey.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${foundRecipes.length} options found for you",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            foundRecipes.length,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: RecipeCard(
                                recipe: foundRecipes[index],
                                others: snapshot.data!,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
