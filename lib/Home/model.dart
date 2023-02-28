import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

bool productbool = false;

// product model
class Product with ChangeNotifier {
  final double price;
  String image;
  String title;

  Product({
    required this.price,
    required this.image,
    required this.title,
  });
}

// company  model
class Compony with ChangeNotifier {
  String image;
  String companyname;

  Compony({
    required this.image,
    required this.companyname,
  });
}

// list of product model
class ListProduct with ChangeNotifier {
  String price;
  String image;
  String title;
  String companyname;
  String productcategory;
  String discription;
  String id;

  ListProduct({
    required this.price,
    required this.id,
    required this.image,
    required this.title,
    required this.companyname,
    required this.discription,
    required this.productcategory,
  });
}

// fetch advert image
class Adertimage with ChangeNotifier {
  String image;

  Adertimage({
    required this.image,
  });
}

class Productman with ChangeNotifier {
  late Product productModel;
  late Compony componyModel;
  late ListProduct listModel;
  late Adertimage listAdvert;
  List<Product> products = [];

  fatchFreshProductData() async {
    List<Product> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("newpro").get();

    value.docs.forEach(
      (element) {
        productModel = Product(
          price: element.get("price"),
          image: element.get("image"),
          title: element.get("title"),
        );
        newList.add(productModel);
        print(productModel.price);
        products = newList;
        notifyListeners();
      },
    );
  }

  get getCategoryDataList {
    return products;
  }

  // company  fetch
  List<Compony> categoryProductList = [];
  fatchcategoryProductData() async {
    List<Compony> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("company").get();

    value.docs.forEach(
      (element) {
        componyModel = Compony(
          image: element.get("image"),
          companyname: element.get("companyname"),
        );
        newList.add(componyModel);

        categoryProductList = newList;
        notifyListeners();
      },
    );
  }

  get getcategoryProductList {
    return categoryProductList;
  }

// list of product
  List<ListProduct> listProductList = [];
  fetchlistProductData() async {
    List<ListProduct> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("eaststar").get();

    value.docs.forEach(
      (element) {
        // double aa = double.parse(element.get("price"));

        listModel = ListProduct(
          price: element.get("price"),
          image: element.get("image"),
          id: element.get("timeStamp").toString(),
          title: element.get("title"),
          companyname: element.get("companyname"),
          productcategory: element.get("productcategory"),
          discription: element.get("discription"),
        );
        newList.add(listModel);

        listProductList = newList;
        notifyListeners();
      },
    );
  }

  get getlistProductList {
    return listProductList;
  }

  // fetch advert image
  List<Adertimage> advertProductList = [];
  AdvertProductData() async {
    List<Adertimage> advertList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("category").get();

    value.docs.forEach(
      (element) {
        listAdvert = Adertimage(
          image: element.get("image"),
        );
        advertList.add(listAdvert);

        advertProductList = advertList;
        notifyListeners();
      },
    );
  }

  get getadvertProductList {
    return advertProductList;
  }

  ListProduct findById(String productId) {
    return listProductList.firstWhere((element) => element.id == productId);
  }

  List<ListProduct> findByCategory(String categoryName) {
    List _categoryList = listProductList
        .where((element) => element.title == categoryName
            ? element.title.toLowerCase().contains(categoryName.toLowerCase())
            : element.companyname
                .toLowerCase()
                .contains(categoryName.toLowerCase()))
        .toList();
    return [..._categoryList];
  }

  List<ListProduct> searchQuery(String searchText) {
    List _searchList = listProductList
        .where((element) =>
            element.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    return [..._searchList];
  }
}
