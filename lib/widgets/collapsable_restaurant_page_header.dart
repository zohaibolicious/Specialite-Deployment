import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:specialite/models/restaurant_object.dart';

class CollapsableRestaurantPageHeader
    implements SliverPersistentHeaderDelegate {
  final double minExtent = 60;
  final double maxExtent = 270;

  final RestaurantObject restoObject;

  CollapsableRestaurantPageHeader({this.restoObject});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.white,
          height: 270,
          child: Opacity(
            opacity: titleOpacity(shrinkOffset),
            child: CachedNetworkImage(
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                fit: BoxFit.cover,
                imageUrl: restoObject.imageURL),
          ),
        ),

        Positioned(
          left: 20,
          top: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 20,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    restoObject.title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                            .withOpacity(profileOpacity(shrinkOffset))),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 20,
          top: 10,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 20,
                child: IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 20,
                child: IconButton(
                  icon: Icon(Icons.settings),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),

        // !  Bottom bar
        Positioned(
          left: 0,
          bottom: -3,
          child: Container(
            width: 1000,
            height: 1,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.grey.withOpacity(bottomLineOpacity(shrinkOffset)),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  double titleOpacity(double shrinkOffset) {
    // simple formula: fade out text as soon as shrinkOffset > 0

    return 1 - max(0, shrinkOffset) / maxExtent;

    // return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  double profileOpacity(double shrinkOffset) {
    return 0 + max(0.0, shrinkOffset) / maxExtent;
  }

  double bottomLineOpacity(double shrinkOffset) {
    // more complex formula: starts fading in text when shrinkOffset > minExtent
    return 0 + max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

  @override
  // TODO: implement showOnScreenConfiguration
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration => throw UnimplementedError();

  @override
  // TODO: implement vsync
  TickerProvider get vsync => throw UnimplementedError();
}
