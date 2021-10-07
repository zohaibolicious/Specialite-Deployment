import 'package:flutter/material.dart';
import 'package:specialite/restaurantcards/xxl_card.dart';
import 'package:specialite/services/restaurant_service.dart';

class XXLBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: RestaurantService().getRestaurants().map((object) {
        return XXLCard(restoObject: object);
      }).toList(),
    );
  }
}
