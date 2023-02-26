import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_league/Reuse/FoodImagePost.dart';

class Person{
  final String uid;
  String? username;
  int dailyCaloriesIntake;

  Person(this.uid, this.username, {this.dailyCaloriesIntake=0});
  factory Person.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Person(
      data?['uid'],
      data?['username'],
      dailyCaloriesIntake: data?['dailyCaloriesIntake'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (uid != null) "uid": uid,
      if (username != null) "username": username,
      if (dailyCaloriesIntake != null) "dailyCaloriesIntake": dailyCaloriesIntake,
    };
  }
}