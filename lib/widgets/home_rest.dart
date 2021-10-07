import 'package:flutter/material.dart';
import 'package:specialite/cards/home/rest_card.dart';
import 'package:specialite/services/restaurant_service.dart';
import '../constants.dart' as constants;
import '../data.dart';

class HomeRest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 210,
        child: ListView(
            scrollDirection: Axis.horizontal,
            padding: constants.PADDING_LTRB,
            children: data.restaurants.map((object) {
              return RestCard(restoObject: object); //Feature(photo);
            }).toList()));
  }
}
