import 'dart:convert';
import 'package:specialite/models/category_object.dart';
import 'package:http/http.dart' as http;
import 'package:specialite/models/dish_object.dart';

class CategoryService {
  Future<List<CategoryObject>> fetchCategoryObjects() async {
    List<CategoryObject> _listOfCategories = [];
    final response = await http.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));

    if (response.statusCode == 200) {
      Map<String, dynamic> d = jsonDecode(response.body);
      _listOfCategories = List<CategoryObject>.from(
          d['categories'].map((x) => CategoryObject.fromJson(x)));

      _listOfCategories.shuffle();
      print(
          'Success - fetchCategoryObjects() - fetched ${_listOfCategories.length} categories');
      return _listOfCategories;
    } else {
      throw Exception('Failure - fetchCategoryObjects()');
    }
  }

  Future<List<DishObject>> fetchDishesByCategory(
      CategoryObject categoryObject) async {
    List<DishObject> _listOfDishes = [];
    final response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=${categoryObject.title}'));

    if (response.statusCode == 200) {
      print('Success - fetchDishesByCategory()');

      Map<String, dynamic> d = jsonDecode(response.body);
      _listOfDishes =
          List<DishObject>.from(d['meals'].map((x) => DishObject.fromJson(x)));

      _listOfDishes.shuffle();
      return _listOfDishes;
    } else {
      throw Exception('Failure - fetchDishesByCategory()');
    }
  }
}
