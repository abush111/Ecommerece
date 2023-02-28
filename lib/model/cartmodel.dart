import 'package:flutter/material.dart';

class CartItem with ChangeNotifier {
  final String id;
  final String title;

  final double price;
  final int quantity;

  final String image;

  CartItem(
      {required this.id,
      required this.title,
      required this.image,
      required this.price,
      required this.quantity});
}
