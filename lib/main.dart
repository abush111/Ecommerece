import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Home/Home.dart';

import 'package:flutterapp/Home/model.dart';
import 'package:flutterapp/Home/Company.dart';
import 'package:flutterapp/Login/Login.dart';
import 'package:flutterapp/Onbroading/broadscreen.dart';
import 'package:flutterapp/model/ordermodel.dart';
import 'package:flutterapp/page/screeen/Homescreen.dart';
import 'package:flutterapp/page/screeen/searchscreen.dart';
import 'package:flutterapp/provider/cartprovider.dart';
import 'package:flutterapp/provider/crud.dart';

import 'package:flutterapp/route/route.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  email = prefs.getString('email');
  print(email);
  runApp(MyApp());
}

var email;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Productman()),
        ChangeNotifierProvider.value(value: CartProvider()),
        ChangeNotifierProvider.value(value: Orders()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: OnboardingScreen(),
        routes: AppRoutes.define(),
      ),
    );
  }
}
