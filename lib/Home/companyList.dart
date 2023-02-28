import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Company.dart';
import 'model.dart';

class companyScreen extends StatelessWidget {
  static const routeName = '/Feeds';
  List<Compony> productC = [];
  @override
  Widget build(BuildContext context) {
    Productman carData = Provider.of<Productman>(context);
    carData.fatchcategoryProductData();

    productC = carData.categoryProductList;

    return Scaffold(
        body: Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(productC.length, (index) {
          return ChangeNotifierProvider.value(
            value: productC[index],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Listitem(
                index: index,
              ),
            ),
          );
        }),
      ),
    ));
  }
}
