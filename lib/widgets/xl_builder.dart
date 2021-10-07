import 'package:flutter/material.dart';
import 'package:specialite/restaurantcards/xl_card.dart';
import 'package:specialite/services/restaurant_service.dart';

class XLBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 275,
        child: ListView(
            physics: PageScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            children: RestaurantService().getRestaurants().map((object) {
              return XLCard(restoObject: object); //Feature(photo);
            }).toList()));
  }
}
