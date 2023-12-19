import 'package:flutter/material.dart';

import '../../components/search_bar.dart';
import '../../constants/common.dart';
import '../search_screen/search_rescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> demoIngredients = [
    "Gari",
    "Cassava Dough",
    "Yam",
    "Cabbage",
    "Tomatoes"
  ];

  final TextEditingController ingredientsController = TextEditingController();
  bool chipSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(homeBg), fit: BoxFit.cover),
        ),
        child: Container(
          color: Colors.white.withOpacity(0.5),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SearchBarr(
                controller: ingredientsController,
                prefix: const HeroIcon(
                  HeroIcons.magnifyingGlass,
                  style: HeroIconStyle.outline,
                  color: Colors.black,
                ),
                filledColor: Colors.white,
                hintText: "What do you have?",
                suffix: IconButton(
                  onPressed: () {
                    if (ingredientsController.text != "") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => SearchResultsScreen(
                            query: ingredientsController.text.trim(),
                          ),
                        ),
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ),
                onFieldSubmitted: (value) {
                  if (value != "") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => SearchResultsScreen(
                          query: ingredientsController.text.trim(),
                        ),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Wrap(
                spacing: 8,
                children: [
                  ...List<Widget>.generate(
                    demoIngredients.length,
                    (index) => FilterChip(
                      backgroundColor: Colors.white,
                      label: Text(
                        demoIngredients[index],
                      ),
                      selected: ingredientsController.text
                          .contains(demoIngredients[index].toLowerCase()),
                      selectedColor: Colors.green,
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            ingredientsController.text =
                                "${ingredientsController.text}${demoIngredients[index].toLowerCase()} ";
                          } else {
                            ingredientsController.text =
                                ingredientsController.text.substring(
                              0,
                              ingredientsController.text.indexOf(
                                  demoIngredients[index].toLowerCase()),
                            );
                          }
                        });
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
