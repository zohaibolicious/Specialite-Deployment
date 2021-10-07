import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:specialite/models/category_object.dart';
import 'package:specialite/modelss/Category.dart';
import 'package:specialite/pages/category_dishes_page.dart';
import 'package:specialite/screens/profile_screen.dart';

class CatCard extends StatelessWidget {
  CatCard({Key key, @required this.categoryObject}) : super(key: key);

  final Category categoryObject;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 120,
              height: 110,
              child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  fit: BoxFit.cover,
                  imageUrl: categoryObject.image),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    (language=="English")?categoryObject.titleEn:categoryObject.titleJa,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 2,
        // margin: EdgeInsets.all(10),
      ),
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => CategoryDishesPage(categoryObject)));
      },
    );
  }
}
