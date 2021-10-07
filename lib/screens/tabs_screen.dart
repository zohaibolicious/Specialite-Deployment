import 'package:flutter/material.dart';
import 'package:specialite/localization/lang_constants.dart';
import 'package:specialite/screens/delivery.dart';
import 'package:specialite/screens/nearby.dart';
import 'package:specialite/screens/search.dart';
import 'package:specialite/services/category_service.dart';
import 'package:specialite/services/location_service.dart';
import 'package:specialite/constants.dart' as constants;

import 'home_screen.dart';
import 'profile_screen.dart';
import 'cart_screen.dart';

class TabsScreen extends StatefulWidget {
  static String routeName = '/tabsScreen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}


class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;


  final tabs = [
    HomeScreen(),
    Delivery(),
    Nearby(),
    Search(),
    ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    constants.userLocation ??= LocationService().pullLocationData();
    constants.categories ??= CategoryService().fetchCategoryObjects();
    return Scaffold(
      
      body: tabs[_currentIndex],
      
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          iconSize: 27,
          selectedItemColor: Color.fromARGB(255, 239, 67, 37),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                title: Text(getTranslated(context,"h_discover")),
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                title: Text(getTranslated(context,"h_favs")),
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.directions_walk),
                title: Text(getTranslated(context,"h_near")),
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text(getTranslated(context,"h_search")),
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                title: Text(getTranslated(context,"h_me")),
                backgroundColor: Colors.black),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
 
}
