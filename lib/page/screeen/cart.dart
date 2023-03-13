import 'package:flutter/material.dart';
import 'package:flutterapp/model/cartmodel.dart';
import 'package:flutterapp/provider/cartprovider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CartPdt extends StatefulWidget {
  final String productId;
  final String nameitem;

  const CartPdt({
    super.key,
    required this.productId,
    required this.nameitem,
  });

  @override
  State<CartPdt> createState() => _CartPdtState();
}

class _CartPdtState extends State<CartPdt> {
  //final String id;
  @override
  Widget build(BuildContext context) {
    final cartAttr = Provider.of<CartItem>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    double subTotal = cartAttr.price * cartAttr.quantity;

    String? item = cartAttr.title;
    List<String> nameitem = [];

    return InkWell(
      onTap: () {},
      child: Container(
        height: 135,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(16.0),
            topRight: Radius.circular(6.0),
            bottomLeft: Radius.circular(6.0),
            topLeft: Radius.circular(6.0),
          ),
          color: Colors.grey[700],
        ),
        child: Row(
          children: [
            Container(
              width: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(cartAttr.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            item = cartAttr.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: GestureDetector(
                            // borderRadius: BorderRadius.circular(32.0),
                            // splashColor: ,
                            onTap: () {
                              cartProvider.removeItem(widget.productId);
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              child: FaIcon(
                                FontAwesomeIcons.xmark,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            'Price:',
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${cartAttr.price}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Sub Total:\$${subTotal.toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4.0),
                            // splashColor: ,
                            onTap: cartAttr.quantity < 2
                                ? null
                                : () {
                                    cartProvider.reduceItemByOne(
                                        widget.productId,
                                        cartAttr.title,
                                        cartAttr.price,
                                        cartAttr.image);
                                  },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.remove,
                                  size: 22,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 12,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(),
                            child: Text(
                              cartAttr.quantity.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4.0),
                            // splashColor: ,
                            onTap: () {
                              cartProvider.addItem(
                                  widget.productId,
                                  cartAttr.title,
                                  cartAttr.price,
                                  cartAttr.image);

                              nameitem.add(cartAttr.title);
                            },

                            child: Container(
                              // ignore: prefer_const_constructors
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                // ignore: prefer_const_constructors
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
