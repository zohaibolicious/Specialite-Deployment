import 'package:specialite/models/dish_object.dart';
import 'package:specialite/models/special_object.dart';
import 'package:specialite/services/dish_service.dart';
import 'dart:math' as math;

class SpecialsService {
  Future<List<SpecialObject>> fetchSpecials() async {
    int howMany = math.Random().nextInt(6) + 4;
    List<SpecialObject> list = [];
    for (int i = 0; i < howMany; i++) {
      DishObject dish = await DishService().fetchARandomDish();
      SpecialObject special = SpecialObject(
        imgURL: dish.imgURL,
        title: dish.title,
      );
      special.newPrice =
          math.Random().nextInt(15).toDouble() + 3 + math.Random().nextDouble();
      list.add(special);
    }

    print(
        'Success - fetchSpecials() - fetched and created ${list.length} specials');
    return list;
  }
}
