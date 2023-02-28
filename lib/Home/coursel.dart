import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Home/model.dart';
import 'package:provider/provider.dart';

class Homecoursel extends StatelessWidget {
  List imgList = [
    "assets/images/photo_2023-01-09_10-46-59.jpg",
  ];
  List<Adertimage> productC = [];

  Homecoursel({super.key});
  @override
  Widget build(BuildContext context) {
    Productman productsAttributes = Provider.of<Productman>(context);
    productsAttributes.AdvertProductData();
    productC = productsAttributes.advertProductList;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.23,
            aspectRatio: 16 / 9,
            viewportFraction: 0.9,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          items: productC.map((imgurl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: const Color.fromRGBO(220, 220, 220, 0.9),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Image.network(imgurl.image),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ]),
    );
  }
}
