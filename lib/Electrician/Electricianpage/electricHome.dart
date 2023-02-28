import 'package:flutter/material.dart';

import 'package:flutterapp/Home/Listofprouct.dart';

import 'package:flutterapp/Home/coursel.dart';
import 'package:flutterapp/Home/model.dart';
import 'package:flutterapp/Home/Company.dart';
import 'package:flutterapp/page/screeen/listView.dart';
import 'package:flutterapp/widget/listproduct.dart';
import 'package:provider/provider.dart';

class elctricHome extends StatelessWidget {
  const elctricHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      // margin: EdgeInsets.only(left: 10, right: 10),

      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              color: Colors.white,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.27,
                        width: MediaQuery.of(context).size.width,
                        child: Homecoursel(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey[700],
                child: Center(
                    child: Text(
                  " Wel come to  electrician page",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
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
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 10,
                    height: MediaQuery.of(context).size.height * 0.13,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext ctx, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Listitem(
                            index: index,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Container(
                    height: 50,
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
              height: MediaQuery.of(context).size.height,
              child: FeedscreenList(),
            )
          ]),
        ),
      ),
    );
  }
}
