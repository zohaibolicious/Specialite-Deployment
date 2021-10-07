import 'package:flutter/material.dart';

import '../screens/restaurant_screen.dart';

class RestaurantCard extends StatefulWidget {
  @override
  _RestaurantCardState createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 170,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: () => Navigator.of(context).pushNamed(RestaurantScreen.routeName),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 170,
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 0, 0),
                child: Text(
                  "Restaurant 1",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 0, 8),
                child: Text(
                  "Item 1, Item 2, Item 3",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Divider(height: 0,),
              Container(
                width: double.infinity,
                height: 30,
                color: Colors.grey[100],
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                child: Text(
                  '\$\$  |   :)',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
