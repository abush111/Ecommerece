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
  const Homebody({super.key});

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
            Container(
              margin: EdgeInsets.only(top: 30),
              color: Colors.white,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
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
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width - 10,
                      child: SizedBox(
                        child: Text(
                          'Company',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.black),
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
                    width: MediaQuery.of(context).size.width - 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: Text(
                          'Product',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
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
}
