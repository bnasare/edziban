import 'package:http/http.dart' as http;

import '../models/recipe_model.dart';

Future<List<RecipeModel>> fetchRecipe() async {
  final response = await http.get(Uri.parse(
      "https://script.google.com/macros/s/AKfycbwyVI1Jg8Tz3aKpA63RshpO1dr3-1n6YEUQkhU-lL6S0HeUDHabs0nSWbgi5F1em6C1iw/exec"));
  if (response.statusCode == 200) {
    print(response.body);
    return RecipeModel.decodeRecipe(response.body);
  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}
