import 'package:flutter/cupertino.dart';
import 'package:flutterapp/Home/Home.dart';
import 'package:flutterapp/Login/Login.dart';
import 'package:flutterapp/Register/Register.dart';
import 'package:flutterapp/page/screeen/Homescreen.dart';

import 'package:flutterapp/page/screeen/cartscreen.dart';
import 'package:flutterapp/page/screeen/listView.dart';
import 'package:flutterapp/page/screeen/productdetial.dart';
import 'package:flutterapp/page/screeen/searchscreen.dart';
import 'package:flutterapp/widget/listproduct.dart';

class AppRoutes {
  AppRoutes._();

  static const String deialPage = '/detial-page';
  static const String Listpage = '/list-page';
  static const String Cart = '/cart-page';
  static const String Search = '/cart-search';
  static const String Sign = '/cart-sign';
  static const String Signup = '/cart-signup';
  static const String Home = '/cart-home';
  static const String ordernoti = '/cart-ordernoti';

  static Map<String, WidgetBuilder> define() {
    return {
      deialPage: (context) => Newproduct(),
      Cart: (context) => CartScreen(),
      Listpage: (context) => Feedscreen(),
      Search: (context) => Searchscreen(),
      Sign: (context) => RegistrationPage(),
      Signup: (context) => LoginPage(),
      Home: (context) => Homescreen(),
    };
  }
}
