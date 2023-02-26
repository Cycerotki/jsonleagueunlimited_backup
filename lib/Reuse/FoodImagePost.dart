

import 'dart:ffi';
import 'dart:typed_data';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodImagePost {
  final String uid;
  final Timestamp timestamp;
  final Uint8List img;
  final String food_class;
  final bool is_healthy;
  final int calories;
  final String location;
  final List<String> tags;

  FoodImagePost(
      this.uid,
      this.timestamp,
      this.img,
      this.food_class,
      this.is_healthy,
      this.calories,
      this.location,
      this.tags,
      );

  factory FoodImagePost.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return FoodImagePost(
      data?['uid'],
      data?['timestamp'],
      data?['img'],
      data?['food_class'],
      data?['is_healthy'],
      data?['calories'],
      data?['location'],
      data?['tags'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (uid != null) "uid": uid,
      if (timestamp != null) "timestamp ": timestamp ,
      if (img != null) "img": img,
      if (food_class != null) "food_class": food_class,
      if (is_healthy != null) "is_healthy": is_healthy,
      if (calories != null) "calories": calories,
      if (location != null) "location": location,
      if (tags != null) "tags": tags,
    };
  }
}