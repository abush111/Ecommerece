import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Home/model.dart';
import 'package:flutterapp/Home/Company.dart';
import 'package:flutterapp/provider/cartprovider.dart';
import 'package:flutterapp/route/route.dart';
import 'package:flutterapp/widget/listproduct.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

// all product list
class Feedscreen extends StatefulWidget {
  String? title;
  static const routeName = '/Feeds';

  Feedscreen({super.key, this.title});

  @override
  State<Feedscreen> createState() => _FeedscreenState();
}

class _FeedscreenState extends State<Feedscreen> {
  List<ListProduct> productC = [];

  @override
  Widget build(BuildContext context) {
    Productman productsAttributes = Provider.of<Productman>(context);
    productsAttributes.fetchlistProductData();
    productC = productsAttributes.listProductList;
    final productsProvider = Provider.of<Productman>(context, listen: false);
    final categoryName = ModalRoute.of(context)?.settings.arguments as String?;
    print(categoryName);

    final productsList = productsProvider.findByCategory('${widget.title}');
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.lightBlue,
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
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 3.7 / 4,
              maxCrossAxisExtent: 260,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            children: List.generate(productsList.length, (index) {
              return ChangeNotifierProvider.value(
                value: productsList[index],
                child: Feedlist(),
              );
            }),
          ),
        ));
//         StaggeredGridView.countBuilder(
//           padding: ,
//   crossAxisCount: 6,
//   itemCount: 8,
//   itemBuilder: (BuildContext context, int index) =>FeedProducts(),
//   staggeredTileBuilder: (int index) =>
//       new StaggeredTile.count(3, index.isEven ? 4 : 5),
//   mainAxisSpacing: 8.0,
//   crossAxisSpacing: 6.0,
// ),
  }
}

class FeedscreenList extends StatelessWidget {
  static const routeName = '/Feeds';
  List<ListProduct> productC = [];
  @override
  Widget build(BuildContext context) {
    Productman productsAttributes = Provider.of<Productman>(context);
    productsAttributes.fetchlistProductData();
    productC = productsAttributes.listProductList;

    return Scaffold(
        body: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3.7 / 4,
          maxCrossAxisExtent: 260,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(productC.length, (index) {
          return ChangeNotifierProvider.value(
            value: productC[index],
            child: Feedlist(),
          );
        }),
      ),
    ));
  }
}
