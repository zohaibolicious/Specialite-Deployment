
class Dish {
  final String name;
  final String rest;
  final String image;
  final List<String> times;
  final List<int> prices;
  int quantity=0;
  int selectedIndex=0;
  bool isSelected=false;

  Dish({this.times, this.prices, this.name, this.rest, this.image});
}