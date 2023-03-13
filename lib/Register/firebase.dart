import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/route/route.dart';
import 'package:uuid/uuid.dart';

class userManagement {
  storeNewUser(
    String email,
    String name,
    String phone,
    String city,
    String house,
    String role,
    Uuid,
  ) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('users').doc(firebaseUser!.uid).set({
      'email': email,
      'name': name,
      'Role': role,
      'house': house,
      'phone': phone,
      'city': city,
      'uid': Uuid,
    }).catchError((e) {
      print(e);
    });
  }
}
