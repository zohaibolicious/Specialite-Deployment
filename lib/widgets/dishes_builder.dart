import 'package:flutter/material.dart';
import 'package:specialite/models/category_object.dart';
import 'package:specialite/models/dish_object.dart';
import 'package:specialite/restaurantcards/dish_card.dart';
import 'package:specialite/restaurantcards/dish_card_big.dart';

import 'package:specialite/services/category_service.dart';

class DishesBuilder extends StatelessWidget {
  final CategoryObject categoryObject;

  DishesBuilder(this.categoryObject);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CategoryService().fetchDishesByCategory(categoryObject),
        builder:
            (BuildContext context, AsyncSnapshot<List<DishObject>> snapshot) {
          if (snapshot.hasData) {
            return Container(
              color: Colors.white,
              child: ListView(children: [
                Wrap(
                    children: snapshot.data.map((object) {
                  return DishCardBig(dishObject: object); //Feature(photo);
                }).toList())
              ]),
            );
          } else {
            return Center(
              child: SizedBox(
                height: 75,
                width: 75,
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
