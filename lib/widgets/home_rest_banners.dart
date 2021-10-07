import 'package:flutter/material.dart';
import 'package:specialite/cards/home/rest_banner_card.dart';
import 'package:specialite/restaurantcards/xl_card.dart';
import 'package:specialite/services/restaurant_service.dart';
import '../data.dart';

class RestBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 275,
        child: ListView(
            physics: PageScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            children: data.restaurants.map((object) {
              return RestBannerCard(restoObject: object); //Feature(photo);
            }).toList()));
  }
}
