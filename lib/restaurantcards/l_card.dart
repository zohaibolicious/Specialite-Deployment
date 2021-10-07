import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:specialite/models/special_object.dart';
import 'package:specialite/pages/dish_page.dart';

class LCard extends StatelessWidget {
  LCard({Key key, @required this.specialObject}) : super(key: key);

  final SpecialObject specialObject;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              children: [
                Container(
                  width: 240,
                  height: 145,
                  child: CachedNetworkImage(
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      fit: BoxFit.cover,
                      imageUrl: specialObject.imgURL),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        specialObject.title,
                        style: TextStyle(
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black,
                            )
                          ],
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 15,
                  child: Container(
                    height: 45,
                    width: 45,
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        specialObject.newPrice.toStringAsFixed(2),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            elevation: 2,
          ),
        ],
      ),
      onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DishPage(specialObject)));
        });
      // onTap: () {
      //   Scaffold.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text(specialObject.title),
      //       duration: Duration(seconds: 1),
      //     ),
      //   );
      // },
    //);
  }
}
