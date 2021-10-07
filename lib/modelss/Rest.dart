import 'package:specialite/modelss/Dish.dart';

class Rest {
  String title;
  String subtitle;
  String image;
  String price;
  String description;
  String opening;
  String closing;
  int place;
  String id;
  String type;
  double rating;
  bool isFav;
  List dishes = <Dish>[];

  Rest(
      {this.title,
      this.subtitle,
      this.image,
      this.price,
      this.description,
      this.opening,
      this.closing,
      this.place,
      this.id,
      this.type,
      this.rating,
      this.isFav,
      this.dishes});
}
