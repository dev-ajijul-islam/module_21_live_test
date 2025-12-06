import 'package:flutter/material.dart';
import 'recipie_model.dart';

class RecipesScreen extends StatelessWidget {
  final Map<String, dynamic> jsonData;

  const RecipesScreen({super.key, required this.jsonData});

  List<RecipeModel> parseRecipes(Map<String, dynamic> data) {
    final List list = data["recipes"] ?? [];
    return list
        .map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final recipes = parseRecipes(jsonData);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text("Recipes"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 10,),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];

          return ListTile(
            leading: Icon(Icons.fastfood_sharp),
            tileColor: Colors.white,
            title: Text(recipe.title),
            subtitle: Text(
              recipe.description,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
    );
  }
}
