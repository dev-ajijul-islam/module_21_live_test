class RecipeModel {
  final String title;
  final String description;
  final List<String> ingredients;

  RecipeModel({
    required this.title,
    required this.description,
    required this.ingredients,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      ingredients: json['ingredients'] != null
          ? List<String>.from(json['ingredients'])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'ingredients': ingredients,
    };
  }
}
