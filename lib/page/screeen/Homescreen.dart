import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/Home/Home.dart';
import 'package:flutterapp/page/screeen/Drawerscreen.dart';
import 'package:flutterapp/page/screeen/searchscreen.dart';
import 'package:flutterapp/route/route.dart';
import 'package:provider/provider.dart';

import '../../provider/cartprovider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Color.fromRGBO(2, 22, 56, 1),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 35.0,
            ),
            child: Center(
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width - 100,
                child: TextField(
                  onTap: (() {
                    Navigator.of(context).pushNamed(AppRoutes.Search);
                  }),
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(color: Colors.black)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(color: Colors.black)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(color: Colors.black)),
                    hintText: "Search ",
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.black,
                  ),
                ),
              ),
            ),
          ),
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
      ),
      drawer: Maindrawer(),
      body: Homebody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
    );
  }
}
