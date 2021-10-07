import 'package:flutter/material.dart';
import 'package:specialite/restaurantcards/xs_card.dart';
import 'package:specialite/services/restaurant_service.dart';

import '../constants.dart' as constants;

class XSBuilder extends StatelessWidget {
  XSBuilder(
      {this.howMany,
      this.showDeliveryPrice = false,
      this.addBottomLine = false});
  final int howMany;
  final bool showDeliveryPrice;
  final bool addBottomLine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: constants.PADDING_LTRB,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:
            RestaurantService().getNumberOfRestaurants(howMany).map((object) {
          return Column(
            children: [
              XSCard(
                  restoObject: object,
                  showDeliveryPrice: showDeliveryPrice,
                  showBottomLine: addBottomLine),
            ],
          );
        }).toList(),
      ),
    );
  }
}
