import 'package:specialite/models/dish_object.dart';

class SpecialObject {
  final String imgURL;
  final String title;
  final String subtitle;
  final bool discounted;
  final double price;
  double newPrice;

  SpecialObject(
      {DishObject dishObject,
        this.imgURL,
        this.title,
        this.subtitle,
        this.discounted,
        this.price,
        this.newPrice});

  factory SpecialObject.fromJson(Map<String, dynamic> json) {
    return SpecialObject(
      title: json['strMeal'],
      imgURL: json['strMealThumb'],
    );
  }
}
