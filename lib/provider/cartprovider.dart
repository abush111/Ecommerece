import 'package:flutter/material.dart';
import 'package:flutterapp/model/cartmodel.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};
  List nameItem = [];

  Map<String, CartItem> get getCartItems {
    return {..._cartItems};
  }

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  List get totalname {
    String? total;
    _cartItems.forEach((key, value) {
      total = value.title;
      nameItem.add(total);
    });

    return nameItem;
  }

  void titelItem(String title) {}

  void addItem(String pdtid, String title, double price, String image) {
    if (_cartItems.containsKey(pdtid)) {
      _cartItems.update(
        pdtid,
        (existingCartItem) => CartItem(
            id: DateTime.now().toString(),
            image: existingCartItem.image,
            title: existingCartItem.title,
            quantity: existingCartItem.quantity + 1,
            price: existingCartItem.price),
      );
    } else {
      _cartItems.putIfAbsent(
          pdtid,
          () => CartItem(
                title: title,
                id: DateTime.now().toString(),
                quantity: 1,
                image: image,
                price: price,
              ));
    }
    notifyListeners();
  }

  // void removeItem(String id) {
  //   _cartItems.remove(id);
  //   notifyListeners();
  // }

  void reduceItemByOne(
      String productId, String title, double price, String image) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (exitingCartItem) => CartItem(
              id: exitingCartItem.id,
              title: exitingCartItem.title,
              price: exitingCartItem.price,
              quantity: exitingCartItem.quantity - 1,
              image: exitingCartItem.image));
    }
    notifyListeners();
  }
  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }
  
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
