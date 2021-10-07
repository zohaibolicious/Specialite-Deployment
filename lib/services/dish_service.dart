import 'dart:async';
import 'dart:convert';
import 'package:specialite/models/category_object.dart';
import 'package:specialite/models/dish_object.dart';
import 'package:http/http.dart' as http;
import 'package:specialite/services/category_service.dart';
import '../constants.dart' as constants;

class DishService {
  Future<DishObject> fetchARandomDish() async {
    List<DishObject> _listOfDishes = [];
    final response = await http
        .get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));

    if (response.statusCode == 200) {
      Map<String, dynamic> d = jsonDecode(response.body);
      //TODO needs refactoring
      _listOfDishes = List<DishObject>.from(
        d['meals'].map(
          (x) => DishObject.fromJson(x),
        ),
      );

      print('Success - fetchARandomDish() - ${_listOfDishes[0].title}');
      return _listOfDishes[0];
    } else {
      throw Exception('Failure - fetchARandomDish()');
    }
  }

  Future<List<DishObject>> pullRandomMenu() async {
    List<DishObject> dishes = [];
    List<CategoryObject> categories = await constants.categories;
    categories.shuffle();

    int numberOfCategories = 2;

    for (int i = 0; i < numberOfCategories; i++) {
      if (dishes.length > 10) {
        break;
      }
      List<DishObject> fetchedDishes =
          await CategoryService().fetchDishesByCategory(categories[i]);

      for (DishObject obj in fetchedDishes) {
        if (dishes.length > 10) {
          break;
        }
        final response = await http.get(Uri.parse(
            'https://www.themealdb.com/api/json/v1/1/search.php?s=${obj.title}'));

        if (response.statusCode == 200) {
          Map<String, dynamic> d = jsonDecode(response.body);
          List<DishObject> _listOfDishes = List<DishObject>.from(
            d['meals'].map(
              (x) => DishObject.fromJson(x),
            ),
          );

          _listOfDishes.forEach((element) {
            print(
                element.title + ' - contents: ' + element.contents.toString());
          });
          dishes.add(_listOfDishes[0]);
        } else {
          throw Exception(
              'Failure - Pulling a dish contents in dish_service.dart');
        }
      }
    }

    String dishesForPrint = '';
    for (DishObject object in dishes) {
      dishesForPrint += '${object.title}, ';
    }
    dishes.shuffle();
    print(
        'Success - pullRandomMenu() - fetched: ${dishes.length} dishes: $dishesForPrint \n');
    return dishes;
  }
}
