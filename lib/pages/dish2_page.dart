import 'dart:math';

import 'package:specialite/models/dish_object.dart';
import 'package:specialite/models/restaurant_object.dart';
import 'package:flutter/material.dart';
import 'package:specialite/models/special_object.dart';
import 'package:specialite/pages/reserve_page.dart';
import 'package:specialite/widgets/back_button.dart';
import 'package:specialite/widgets/collapsable_restaurant_page_header.dart';
import 'package:specialite/widgets/menu_builder.dart';
import '../constants.dart' as constants;

class DishPage2 extends StatefulWidget {
  DishPage2(this.restoObject);
  final DishObject restoObject;

  @override
  _DishPage2State createState() => _DishPage2State();
}

class _DishPage2State extends State<DishPage2> {
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: BackButtonM(),
              backgroundColor: Colors.white,
              expandedHeight: 200.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                //title: Text("${_subCategory.currentSubCategoryName()}"),
                background: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    image: NetworkImage(
                      widget.restoObject.imgURL,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            // SliverPersistentHeader(
            //   pinned: true,
            //   floating: false,
            //   delegate: CollapsableRestaurantPageHeader(
            //       restoObject: widget.restoObject),
            // ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.restoObject.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        // CircleAvatar(
                        //   backgroundColor: Colors.grey[200],
                        //   child: widget.restoObject.imgURL
                        //       ? IconButton(
                        //           splashRadius: 25,
                        //           padding: EdgeInsets.all(0),
                        //           icon: Icon(
                        //             Icons.favorite,
                        //             color: Colors.red,
                        //             size: 30,
                        //           ),
                        //           onPressed: () {
                        //             super.setState(
                        //               () {
                        //                 widget.restoObject.isFavorite = false;
                        //               },
                        //             );
                        //           },
                        //         )
                        //       : IconButton(
                        //           splashRadius: 25,
                        //           padding: EdgeInsets.all(0),
                        //           icon: Icon(
                        //             Icons.favorite_border,
                        //             color: Colors.black,
                        //             size: 30,
                        //           ),
                        //           onPressed: () {
                        //             setState(() {
                        //               widget.restoObject.isFavorite = true;
                        //             });
                        //           }),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 46, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.restoObject.title,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${(random.nextInt(1000) % 500) + 500} ¥',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: ListTile(
                      leading: Container(
                        child: true ? Text(' 😍') : Text(' 😀'),
                      ),
                      title: Container(
                        child: random.nextInt(20) >= 9
                            ? Text('Excellent    ${10}/10')
                            : Text('Amazing    ${8.5}/10'),
                      ),
                      trailing: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color.fromARGB(50, 224, 177, 65),
                        textColor: Color.fromARGB(255, 224, 177, 65),
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Reserve()))
                        },
                        child: Text(
                          'Reserve',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ListTile(
                  //   leading: Icon(Icons.access_time),
                  //   title: Text('Open'),
                  //   trailing: FlatButton(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(10)),
                  //     color: Color.fromARGB(50, 224, 177, 65),
                  //     textColor: Color.fromARGB(255, 224, 177, 65),
                  //     onPressed: () => {},
                  //     child: Text(
                  //       'More info',
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  /*ListTile(
                    leading: Icon(Icons.motorcycle),
                    title: Text(
                        'Delivery in ${widget.restoObject.baseEstimate} - ${widget.restoObject.baseEstimate + 10} min'),
                    subtitle: FutureBuilder(
                        future: constants.userLocation,
                        builder: (BuildContext context,
                            AsyncSnapshot<UserLocation> snapshot) {
                          if (snapshot.hasData) {
                            return Text(snapshot.data.address);
                          } else {
                            return Text('Loading...');
                          }
                        }),
                    trailing: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Color.fromARGB(50, 224, 177, 65),
                      textColor: Color.fromARGB(255, 224, 177, 65),
                      onPressed: () => {},
                      child: Text(
                        'Change',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),*/
                  ListTile(
                    leading: Icon(Icons.group),
                    title: Text('Start Ordering'),
                    trailing: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Color.fromARGB(50, 224, 177, 65),
                      textColor: Color.fromARGB(255, 224, 177, 65),
                      onPressed: () => {},
                      child: Text(
                        'Order now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: Text(
                      "Similar Dishes",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  constants.PULL_DATA_FROM_WEB
                      ? MenuBuilder()
                      : Center(
                          child: Text('constants.PULL_DATA_FROM_WEB = false'),
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
