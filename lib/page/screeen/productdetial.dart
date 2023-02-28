import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/Home/model.dart';
import 'package:flutterapp/provider/cartprovider.dart';
import 'package:flutterapp/route/route.dart';

import 'package:provider/provider.dart';

class Newproduct extends StatelessWidget {
  static const routeName = '/Newproduct';

  Newproduct({
    super.key,
  });
  List<ListProduct> productC = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Productman productsAttributes = Provider.of<Productman>(context);
    productsAttributes.getcategoryProductList;
    productC = productsAttributes.listProductList;

    final cartProvider = Provider.of<CartProvider>(context);
    final productId = ModalRoute.of(context)?.settings.arguments as String?;

    print('productId $productId');
    final prodAttr = productsAttributes.findById(productId!);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(220, 220, 220, 1),
        elevation: 0,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Consumer<CartProvider>(
                  builder: (_, cart, ch) => Badge(
                        badgeColor: Colors.red,
                        animationType: BadgeAnimationType.slide,
                        toAnimate: true,
                        position: BadgePosition.topEnd(top: 5, end: 7),
                        badgeContent: Text(
                          cart.getCartItems.length.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        child: IconButton(
                            icon: SvgPicture.asset('assets/icons/basket.svg'),
                            iconSize: 35,
                            onPressed: () {
                              Navigator.of(context).pushNamed(AppRoutes.Cart);
                            }),
                      )))
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, right: 20, bottom: 20),
                    height: 200,
                    width: 200,
                    child: Hero(
                      tag: "",
                      child: Image.network(prodAttr.image),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.57,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "${prodAttr.title}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Row(
                          children: [Text("Description")],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                              width: 350,
                              child: Text(
                                "${prodAttr.discription} ",
                                style: TextStyle(color: Colors.black),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 14.0, left: 8, bottom: 8),
                      child: Row(
                        children: [
                          Text(
                            " ${prodAttr.price} Birr",
                            style: TextStyle(color: Colors.black),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 45,
                                  width: 45,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) {
                                            if (states.contains(
                                                MaterialState.pressed)) {
                                              return Colors.lightBlue;
                                              ;
                                            }
                                            return Colors.lightBlue;
                                          }),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      color: Color.fromRGBO(
                                                          162, 184, 212, 1)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          44)))),
                                      onPressed: () {
                                        double aa = double.parse(
                                          prodAttr.price,
                                        );
                                        cartProvider.addItem(prodAttr.id,
                                            prodAttr.title, aa, prodAttr.image);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add, size: 11),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
