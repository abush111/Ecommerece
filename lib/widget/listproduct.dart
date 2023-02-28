import 'package:flutter/material.dart';
import 'package:flutterapp/Home/model.dart';
import 'package:flutterapp/provider/cartprovider.dart';
import 'package:flutterapp/route/route.dart';

import 'package:provider/provider.dart';

class Feedlist extends StatelessWidget {
  Feedlist({super.key});

  @override
  Widget build(BuildContext context) {
    ListProduct productsAttributes = Provider.of<ListProduct>(context);
    final cart = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(AppRoutes.deialPage, arguments: productsAttributes.id);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.21,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Color.fromRGBO(240, 240, 244, 1),
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 7,
                            right: 7,
                            top: 7,
                          ),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Image.network(
                            productsAttributes.image,
                            //   fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                // padding: EdgeInsets.only(left: 5),
                margin: EdgeInsets.only(left: 10, bottom: 2, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      productsAttributes.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        ' ${productsAttributes.price} birr',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            height: 45,
                            width: 45,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return Colors.lightBlue;
                                      ;
                                    }
                                    return Colors.lightBlue;
                                    ;
                                  }),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: Color.fromRGBO(
                                                  162, 184, 212, 1)),
                                          borderRadius:
                                              BorderRadius.circular(44)))),
                              onPressed: (() {
                                double a = double.parse(
                                  productsAttributes.price,
                                );
                                cart.addItem(
                                    productsAttributes.id,
                                    productsAttributes.title,
                                    a,
                                    productsAttributes.image);
                              }),
                              child: Row(
                                children: [
                                  Icon(Icons.add, size: 11),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(18.0),
                              child: Icon(
                                Icons.more_horiz,
                                color: Colors.grey,
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
