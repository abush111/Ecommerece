import 'package:flutter/material.dart';
import 'package:flutterapp/Home/model.dart';
import 'package:flutterapp/model/ordermodel.dart';
import 'package:flutterapp/page/screeen/Homescreen.dart';
import 'package:flutterapp/page/screeen/cart.dart';
import 'package:flutterapp/provider/cartprovider.dart';
import 'package:flutterapp/route/route.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String? lamp;

  List listlamp = [
    1,
  ];

  List<ListProduct> currentList = [];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final carts = Provider.of<Productman>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    //  String item = cartAttr.title;
    return Scaffold(
      bottomSheet: checkoutSection(
          context, cartProvider.totalAmount, cartProvider.totalname),
      backgroundColor: Color.fromRGBO(220, 220, 220, 0.9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   color: Color.fromRGBO(220, 220, 220, 0.9),
        //   borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(60.0),
        //     topRight: Radius.circular(60.0),
        //   ),
        // ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                child: ListView.builder(
                    itemCount: cart.getCartItems.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return ChangeNotifierProvider.value(
                          value:
                              cartProvider.getCartItems.values.toList()[index],
                          child: Column(
                            children: [
                              CartPdt(
                                productId: cartProvider.getCartItems.keys
                                    .toList()[index],
                                nameitem: cartProvider.getCartItems.keys
                                    .toList()[index],
                              ),
                            ],
                          ));

                      // carts.value.toString();
                    }),
              ),
            ),

            // FlatButton(
            //     onPressed: () {
            //     },
            //     child: Text(
            //       'Checkout',
            //       style: TextStyle(color: Colors.blue, fontSize: 20),
            //     ))
          ],
        ),
      ),
    );
  }

  Widget checkoutSection(BuildContext ctx, subTotal, item) {
    final cart = Provider.of<CartProvider>(ctx);
    return Container(
        height: 100,
        // decoration: BoxDecoration(
        //   border: Border(
        //     top: BorderSide(color: Colors.grey, width: 0.5),
        //   ),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${subTotal}birr',
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                        child: SizedBox(
                            width: 100, child: CheckoutButton(cart: cart))),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class CheckoutButton extends StatefulWidget {
  final CartProvider cart;

  const CheckoutButton({required this.cart});
  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success!!!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Order Successfully '),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => Homescreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Container(
      width: 100,
      child: ElevatedButton(
        child: Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: widget.cart.totalAmount <= 0
            ? null
            : () async {
              
                _showMyDialog();
                await Provider.of<Orders>(context, listen: false).addOrder(
                    widget.cart.getCartItems.values.toList(),
                 
                    widget.cart.totalAmount);

                cart.clearCart();
                // Navigator.of(context).pop();
              },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.lightBlue;
              }
              return Colors.lightBlue;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.lightBlue),
                    borderRadius: BorderRadius.circular(6)))),
      ),
    );
  }
}
