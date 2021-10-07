import 'package:flutter/material.dart';
import 'package:specialite/cards/home/category_card.dart';
import 'package:specialite/models/category_object.dart';
import 'package:specialite/restaurantcards/s_card.dart';
import 'package:specialite/services/category_service.dart';
import '../constants.dart' as constants;
import '../data.dart';

class HomeCats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView(
            scrollDirection: Axis.horizontal,
            padding: constants.PADDING_LTRB,
            children: data.categories.map((object) {
              return CatCard(categoryObject: object,); //Feature(photo);
            }).toList()));
          
      //       FutureBuilder(
      //   future: constants.categories ??=
      //       data.categories,
      //   builder: (BuildContext context,
      //       AsyncSnapshot<List<CategoryObject>> snapshot) {
      //       return ListView(
      //           scrollDirection: Axis.horizontal,
      //           padding: constants.PADDING_LTRB,
      //           children: snapshot.data.map((object) {
      //             return SCard(categoryObject: object);
      //           }).toList());
          
      //   },
      // ),
    //);
  }
}
