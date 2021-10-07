import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:specialite/models/restaurant_object.dart';
import 'package:specialite/modelss/Rest.dart';
import 'package:specialite/pages/restaurant_page.dart';
import 'dart:core';

class RestCard extends StatelessWidget {
  RestCard({Key key, @required this.restoObject}) : super(key: key);

  final Rest restoObject;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    double screenHeight = mq.size.height;
    double screenWidth = mq.size.width;
    String title=restoObject.title;
    String subtitle=restoObject.subtitle;
    if (title.length>17){
      title=title.substring(0,16);
      title+="...";
    }
    if (subtitle.length>15){
      subtitle=subtitle.substring(0,15);
      subtitle+="...";
    }
    return InkWell(
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: [
              Container(
                width: 160,
                height: 110,
                child: CachedNetworkImage(
                    placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                    fit: BoxFit.cover,
                    imageUrl: restoObject.image),
              ),
              Positioned(
                bottom: 3,
                left: 7,
                child: Container(
                  //height: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenWidth/30),
                      ),
                      Text(subtitle,
                      style: TextStyle(fontSize: screenWidth/30),),
                      Divider(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("open          ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(' • '),
                          //Text('${restoObject.baseEstimate} min'),
                          Text(' • '),
                          Container(
                            child: restoObject.rating >= 9
                                ? Text(' 😍 ')
                                : restoObject.rating >= 8
                                    ? Text(' 😀 ')
                                    : Text(' 😔 '),
                          ),
                          Text(
                            restoObject.rating.toString(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  color: Colors.black,
                  height: 1,
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 2,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantPage(restoObject),
            ),
          );
        });
  }
}
