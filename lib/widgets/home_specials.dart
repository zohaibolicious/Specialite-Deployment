import 'package:flutter/material.dart';
import 'package:specialite/cards/home/special_card.dart';
import 'package:specialite/models/special_object.dart';
import 'package:specialite/restaurantcards/l_card.dart';
import 'package:specialite/services/specials_service.dart';
import '../constants.dart' as constants;
import '../data.dart';


class HomeSpecials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      child: ListView(
            scrollDirection: Axis.horizontal,
            padding: constants.PADDING_LTRB,
            children: data.specials.map((object) {
              return SpecialCard(specialObject: object); //Feature(photo);
            }).toList()));
    
  }
}
