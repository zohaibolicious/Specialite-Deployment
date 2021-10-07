import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:specialite/models/dish_object.dart';
import 'package:specialite/pages/dish2_page.dart';
import 'package:specialite/pages/dish_page.dart';
import 'package:specialite/services/dish_service.dart';

class MenuBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DishService().pullRandomMenu(),
      builder:
          (BuildContext context, AsyncSnapshot<List<DishObject>> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: snapshot.data.map(
              (object) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    title: InkWell(
                      child: Text(
                        object.title,
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DishPage2(object)));
                      },
                    ),
                    trailing: InkWell(
                      child: Container(
                        height: 80,
                        width: 100,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 1.5,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: CachedNetworkImage(
                              placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                              fit: BoxFit.cover,
                              imageUrl: object.imgURL),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DishPage2(object)));
                      },
                    ),
                  ),
                );
              },
            ).toList(),
          );
        } else {
          return Container(
            height: 250,
            width: 150,
            child: Center(
              child: SizedBox(
                height: 75,
                width: 75,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
