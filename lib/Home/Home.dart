import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Home/Companylist.dart';

import 'package:flutterapp/Home/Listofprouct.dart';

import 'package:flutterapp/Home/coursel.dart';
import 'package:flutterapp/Home/model.dart';
import 'package:flutterapp/Home/Company.dart';
import 'package:flutterapp/page/screeen/listView.dart';
import 'package:flutterapp/widget/listproduct.dart';
import 'package:provider/provider.dart';

class Homebody extends StatelessWidget {
  Homebody({super.key});
  var username;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      // margin: EdgeInsets.only(left: 10, right: 10),

      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey[700],
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FutureBuilder(
                            future: _fetch(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.done)
                                return Text("Loading data...Please wait");
                              return Text(
                                'Hi'
                                " $username",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            " Wel come to  electronics shop",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Colors.white,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.32,
                        width: MediaQuery.of(context).size.width,
                        child: Homecoursel(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Container(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width - 10,
                      child: SizedBox(
                        child: Text(
                          'Company',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Color.fromRGBO(2, 22, 56, 1)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 10,
                      height: MediaQuery.of(context).size.height * 0.13,
                      child: companyScreen()),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: Text(
                          ' All product',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Color.fromRGBO(2, 22, 56, 1)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      margin: EdgeInsets.only(left: 8),
                      child: ElevatedButton(
                        onPressed: (() {}),
                        child: Text(' See all'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Color.fromRGBO(2, 22, 56, 1);
                            }
                            return Color.fromRGBO(2, 22, 56, 1);
                          }),
                        ),
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: MediaQuery.of(context).size.height - 100,
              child: FeedscreenList(),
            )
          ]),
        ),
      ),
    );
  }

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        username = ds.data()!['name'];
      }).catchError((e) {
        print(e);
      });
  }
}
