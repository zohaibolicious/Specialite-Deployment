import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:specialite/localization/lang_constants.dart';
import 'package:specialite/models/restaurant_object.dart';
import 'package:specialite/pages/restaurant_page.dart';

class XSCard extends StatelessWidget {
  XSCard(
      {Key key,
      @required this.restoObject,
      this.showDeliveryPrice = false,
      this.showBottomLine = false})
      : super(key: key);

  final RestaurantObject restoObject;
  final bool showDeliveryPrice;
  final bool showBottomLine;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                        placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                        fit: BoxFit.fill,
                        imageUrl: restoObject.imageURL),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        restoObject.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(restoObject.subtitle),
                      Row(
                        children: [
                          Text(restoObject.pricing),
                          Container(
                              child: showDeliveryPrice
                                  ? Text(getTranslated(context,'f_dine'))
                                  : null),
                          Text(' • '),
                          Text('${restoObject.baseEstimate} min'),
                          Text(' • '),
                          Container(
                              child: restoObject.rating >= 9
                                  ? Text(' 😍 ')
                                  : restoObject.rating >= 8
                                      ? Text(' 😀 ')
                                      : Text(' 😔 ')),
                          Text(
                            restoObject.rating.toString(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            showBottomLine
                ? Divider(
                    endIndent: 20,
                    indent: 75,
                    height: 1,
                    thickness: 2,
                  )
                : Container()
          ],
        ),
        // elevation: 2,
        margin: EdgeInsets.only(bottom: 10),
      ),
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => RestaurantPage(restoObject),
        //   ),
        // );
      },
    );
  }
}
