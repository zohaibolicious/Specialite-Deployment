import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:specialite/models/dish_object.dart';
import 'package:specialite/pages/dish2_page.dart';

class DishCardBig extends StatelessWidget {
  DishCardBig({Key key, @required this.dishObject}) : super(key: key);

  final DishObject dishObject;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                width: 380,
                height: 200,
                child: CachedNetworkImage(
                    placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                    fit: BoxFit.cover,
                    imageUrl: dishObject.imgURL),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: SizedBox(
                width: 190,
                child: Text(
                  dishObject.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 3,
        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DishPage2(dishObject),
          ),
        );
      },
    );
  }
}
