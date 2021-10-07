import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class Restaurant {
  final String id;
  String name;
  String description;
  String image;
  double latitude;
  double longitude;
  List<String> dishes;
  List<String> dishCategories;
  double averageRating;
  int totalRatings;
  DateTime openTime;
  DateTime closeTime;
  int prepTime;
  bool isVisible;

  Restaurant({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.image,
    @required this.latitude,
    @required this.longitude,
    @required this.dishes,
    @required this.dishCategories,
    @required this.averageRating,
    @required this.totalRatings,
    @required this.openTime,
    @required this.closeTime,
    @required this.prepTime,
    @required this.isVisible,
  });

  Restaurant copyWith({
    String id,
    String name,
    String description,
    String image,
    double latitude,
    double longitude,
    List<String> dishes,
    List<String> dishCategories,
    double averageRating,
    int totalRatings,
    DateTime openTime,
    DateTime closeTime,
    int prepTime,
    bool isVisible,
  }) {
    return Restaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      dishes: dishes ?? this.dishes,
      dishCategories: dishCategories ?? this.dishCategories,
      averageRating: averageRating ?? this.averageRating,
      totalRatings: totalRatings ?? this.totalRatings,
      openTime: openTime ?? this.openTime,
      closeTime: closeTime ?? this.closeTime,
      prepTime: prepTime ?? this.prepTime,
      isVisible: isVisible ?? this.isVisible,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'latitude': latitude,
      'longitude': longitude,
      'dishes': dishes,
      'dishCategories': dishCategories,
      'averageRating': averageRating,
      'totalRatings': totalRatings,
      'openTime': openTime.millisecondsSinceEpoch,
      'closeTime': closeTime.millisecondsSinceEpoch,
      'prepTime': prepTime,
      'isVisible': isVisible,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      image: map['image'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      dishes: List<String>.from(map['dishes']),
      dishCategories: List<String>.from(map['dishCategories']),
      averageRating: map['averageRating'],
      totalRatings: map['totalRatings'],
      openTime: DateTime.fromMillisecondsSinceEpoch(map['openTime']),
      closeTime: DateTime.fromMillisecondsSinceEpoch(map['closeTime']),
      prepTime: map['prepTime'],
      isVisible: map['isVisible'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurant.fromJson(String source) => Restaurant.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Restaurant(id: $id, name: $name, description: $description, image: $image, latitude: $latitude, longitude: $longitude, dishes: $dishes, dishCategories: $dishCategories, averageRating: $averageRating, totalRatings: $totalRatings, openTime: $openTime, closeTime: $closeTime, prepTime: $prepTime, isVisible: $isVisible)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is Restaurant &&
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.image == image &&
      other.latitude == latitude &&
      other.longitude == longitude &&
      listEquals(other.dishes, dishes) &&
      listEquals(other.dishCategories, dishCategories) &&
      other.averageRating == averageRating &&
      other.totalRatings == totalRatings &&
      other.openTime == openTime &&
      other.closeTime == closeTime &&
      other.prepTime == prepTime &&
      other.isVisible == isVisible;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      image.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      dishes.hashCode ^
      dishCategories.hashCode ^
      averageRating.hashCode ^
      totalRatings.hashCode ^
      openTime.hashCode ^
      closeTime.hashCode ^
      prepTime.hashCode ^
      isVisible.hashCode;
  }
}
