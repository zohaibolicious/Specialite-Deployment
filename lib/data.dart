import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:specialite/modelss/Category.dart';
import 'package:specialite/modelss/Special.dart';
import 'package:specialite/modelss/Dish.dart';
import 'package:specialite/modelss/Rest.dart';

import 'modelss/Order.dart';

class data {
  static var restaurants = <Rest>[];
  static var categories = <Category>[];
  static var specials = <Special>[];
  static var orders= <Order>[];
  static var dishes= <Dish>[];
  static var newOrder= new Order();
  static var user;

  static final data _singleton = data._internal();

  factory data() {
    return _singleton;
  }

  data._internal();

  static Future getData() async {
    await Firebase.initializeApp();

    final firestoreInstance = FirebaseFirestore.instance;

    await firestoreInstance
        .collection("Restaurants")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) async {
        //print(result.data()['title']);
        // var dishes = <Dish>[];
        //
        // await firestoreInstance
        //     .collection("Dishes")
        //     .where("rest", isEqualTo: result.data()['name'].toString())
        //     .get()
        //     .then((querySnapshot) {
        //   querySnapshot.docs.forEach((result0) {
        //     print(result0.data()['title']);
        //     dishes.add(new Dish(
        //       result0.data()['name'].toString(),
        //       result0.data()['name'].toString(),
        //       result0.data()['name'].toString(),
        //     ));
        //   });
        //   return;
        // });

        restaurants.add(new Rest(
          title: result.data()['name'].toString(),
          description: result.data()['description'].toString(),
          image: result.data()['imageUrl'].toString(),
          price: result.data()['name'].toString(),
          subtitle: result.data()['name'].toString(),
          opening: result.data()['name'].toString(),
          closing: result.data()['name'].toString(),
          rating: 9,
          type: result.data()['name'].toString(),
          place: 9,
          isFav: true,
          dishes: dishes,
          id: result.data()['Document ID'].toString()
        ));
        print(result.data()['Document ID'].toString());
      });


      
      return;
      
    });

    await firestoreInstance
            .collection("Categories")
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((result0) {
            categories.add(new Category(
              result0.data()['titleEn'].toString(),
              result0.data()['titleJa'].toString(),
              result0.data()['image'].toString(),
            ));
          });
          return;
        });
    await firestoreInstance
        .collection("Bookings")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result0) {
        orders.add(new Order(
          orderID: result0.data()['Document ID'].toString(),
          dateTime: result0.data()['dateTime'].toDate(),
          name: List.from(result0.data()['itemName']),
          quantity: List.from(result0.data()['itemQuantity']),
          restName: result0.data()['restName'].toString(),
          userID: result0.data()['userid'].toString(),
        ));
      });
      return;
    });
    await firestoreInstance
        .collection("Dishes")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result0) {
        //List<DateTime> tim=List.from(result0.data()['times'].toDate());
        List<int> pric=List.from(result0.data()['prices']);
        dishes.add(new Dish(
          name: result0.data()['rest'].toString(),
          image: result0.data()['image'].toString(),
          rest: result0.data()['rest'].toString(),
          times: List.from(result0.data()['times']),
          prices: pric,
        ));
      });
      return;
    });

    await firestoreInstance
            .collection("Specials")
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((result0) {
            specials.add(new Special(
              result0.data()['titleEn'].toString(),
              result0.data()['titleJa'].toString(),
              result0.data()['image'].toString(),
            ));
          });
          return;
        });      
  }
}
