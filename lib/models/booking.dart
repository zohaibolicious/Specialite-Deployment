import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class Booking {
  final String id;
  final String restaurantId;
  final String userId;
  Map<String, int> dishes;
  String status;
  List<DateTime> time;
  double price;

  Booking({
    @required this.id,
    @required this.restaurantId,
    @required this.userId,
    @required this.dishes,
    @required this.status,
    @required this.time,
    @required this.price,
  });

  Booking copyWith({
    String id,
    String restaurantId,
    String userId,
    Map<String, int> dishes,
    String status,
    List<DateTime> time,
    double price,
  }) {
    return Booking(
      id: id ?? this.id,
      restaurantId: restaurantId ?? this.restaurantId,
      userId: userId ?? this.userId,
      dishes: dishes ?? this.dishes,
      status: status ?? this.status,
      time: time ?? this.time,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'restaurantId': restaurantId,
      'userId': userId,
      'dishes': dishes,
      'status': status,
      'time': time?.map((x) => x.millisecondsSinceEpoch)?.toList(),
      'price': price,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'],
      restaurantId: map['restaurantId'],
      userId: map['userId'],
      dishes: Map<String, int>.from(map['dishes']),
      status: map['status'],
      time: List<DateTime>.from(map['time']?.map((x) => DateTime.fromMillisecondsSinceEpoch(x))),
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) => Booking.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Booking(id: $id, restaurantId: $restaurantId, userId: $userId, dishes: $dishes, status: $status, time: $time, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final collectionEquals = const DeepCollectionEquality().equals;
  
    return other is Booking &&
      other.id == id &&
      other.restaurantId == restaurantId &&
      other.userId == userId &&
      collectionEquals(other.dishes, dishes) &&
      other.status == status &&
      collectionEquals(other.time, time) &&
      other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      restaurantId.hashCode ^
      userId.hashCode ^
      dishes.hashCode ^
      status.hashCode ^
      time.hashCode ^
      price.hashCode;
  }
}
