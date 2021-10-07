class DishObject {
  String title;
  String imgURL;
  List<String> contents;
  DishObject({this.contents, this.title, this.imgURL});

  factory DishObject.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    for (int i = 1; i <= 20; i++) {
      if (json.containsKey('strIngredient$i') &&
          json['strIngredient$i'] != "") {
        String ingredient = json['strIngredient$i'];
        ingredients.add(ingredient);
      }
    }
    return DishObject(
        title: json['strMeal'],
        imgURL: json['strMealThumb'],
        contents: ingredients);
  }
}
