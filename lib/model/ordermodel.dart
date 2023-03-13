import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp/model/cartmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderItem {
  final String name;
  final String phone;
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.name,
    required this.phone,
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final prefs = await SharedPreferences.getInstance();

    var name = prefs.getString('name');
    var phone = prefs.getString('phone');
    final timeStamp = DateTime.now();
    try {
      FirebaseFirestore.instance.collection('usersTest').doc().set({
        'id': DateTime.now().toString(),
        'name': name.toString(),
        'phone': phone.toString(),
        'amount': total,
        'dateTime': timeStamp.toIso8601String(),
        'products': cartProducts
            .map((cp) => {
                  'id': cp.id,
                  'title': cp.title,
                  'quantity': cp.quantity,
                  'price': cp.price
                })
            .toList(),
      }).catchError((e) {
        print(e);
      });

      _orders.insert(
          0,
          OrderItem(
              name: name.toString(),
              phone: phone.toString(),
              id: DateTime.now().toString(),
              amount: total,
              dateTime: timeStamp,
              products: cartProducts));
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }
}
