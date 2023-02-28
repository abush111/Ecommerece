import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Home/model.dart';
import 'package:flutterapp/route/route.dart';
// company category feed page

import 'package:provider/provider.dart';

import '../page/screeen/listView.dart';

class Listitem extends StatefulWidget {
  final int index;
  const Listitem({super.key, required this.index});

  @override
  State<Listitem> createState() => _ListitemState();
}

List<Color> colors = [
  Color.fromRGBO(255, 255, 255, 1),
  Color.fromRGBO(255, 255, 255, 1),
  Color.fromRGBO(0, 0, 0, 1),
];

class _ListitemState extends State<Listitem> {
  static bool isPressed = true;
  Offset distance = isPressed ? Offset(10, 10) : Offset(28, 28);
  double blur = isPressed ? 5.0 : 30.0;
  void buttonState() {
    setState(() {
      isPressed = !isPressed;
      // Navigator.of(context).pushNamed(AppRoutes.market);
    });
  }

  @override
  Widget build(BuildContext context) {
    Compony productsAttributes = Provider.of<Compony>(context);

    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.17,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Feedscreen(title: productsAttributes.companyname)),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: IntrinsicWidth(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.23,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(220, 220, 220, 0.9),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(productsAttributes.image),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                boxShadow: isPressed
                    ? [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(1, 1),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-1, 0),
                          blurRadius: 25,
                          spreadRadius: 1,
                        ),
                      ]
                    : null),
            padding: EdgeInsets.all(2),
            child: Text(
              productsAttributes.companyname.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//  feeed all list
class Feedproducts extends StatefulWidget {
  Feedproducts({super.key});

  @override
  State<Feedproducts> createState() => _FeedproductsState();
}

class _FeedproductsState extends State<Feedproducts> {
  @override
  Widget build(BuildContext context) {
    Product productsAttributes = Provider.of<Product>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(AppRoutes.Listpage);
        },
        child: Container(
          width: 10,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: Container(
                        margin: EdgeInsets.all(25),
                        width: double.infinity,
                        constraints:
                            BoxConstraints(minHeight: 50, maxHeight: 50),
                        child: Image.network(
                          productsAttributes.image,
                          //   fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                // margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      productsAttributes.title.toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
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
