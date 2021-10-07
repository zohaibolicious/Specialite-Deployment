import 'package:flutter/material.dart';

import '../widgets/my_back_button.dart';
import '../widgets/restaurant_card.dart';

class RestaurantScreen extends StatefulWidget {
  static String routeName = '/restaurant';

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  bool isFav = false;

  void toggleFav() {
    if (!isFav) {
      setState(() {
        isFav = true;
      });
    } else {
      setState(() {
        isFav = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var statusHeight = MediaQuery.of(context).padding.top;
    var screenHeight = size.height;
    var screenWidth = size.width;

    return Container(
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Container(
            height: screenHeight - statusHeight,
            // padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: myBackButton(),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    // padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Restaurant 1',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(50),
                                onTap: () => toggleFav(),
                                child: isFav
                                    ? Icon(
                                        Icons.favorite,
                                        color: Colors.red[400],
                                      )
                                    : Icon(
                                        Icons.favorite_border,
                                        color: Colors.red[400],
                                      ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Text(
                            'Korean restaurant',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            children: [
                              Icon(Icons.sentiment_satisfied_alt_sharp),
                              SizedBox(width: 10),
                              Text("Rating: 8.9"),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            children: [
                              Icon(Icons.access_time),
                              SizedBox(width: 10),
                              Text("5 PM to 11 PM"),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Text(
                            'Dishes',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 190,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(width: 15),
                              RestaurantCard(),
                              RestaurantCard(),
                              RestaurantCard(),
                              RestaurantCard(),
                              RestaurantCard(),
                              RestaurantCard(),
                              RestaurantCard(),
                              SizedBox(width: 15),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
