import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/Login/Login.dart';

import 'package:provider/provider.dart';

class Maindrawer extends StatefulWidget {
  const Maindrawer({super.key});

  @override
  State<Maindrawer> createState() => _MaindrawerState();
}

class _MaindrawerState extends State<Maindrawer> {
  var myEmail;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  _signOut() async {
    await _auth.signOut().then((value) => Navigator.of(context)
        .pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Color.fromRGBO(2, 22, 56, 1),
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile.png'),
                        fit: BoxFit.fill,
                      )),
                ),
                FutureBuilder(
                  future: _fetch(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done)
                      return Text("Loading data...Please wait");
                    return Text(
                      " $myEmail",
                      style: TextStyle(color: Colors.white),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      " General",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 26),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 45.0, right: 8, top: 8, bottom: 0),
                  child: TextButton(
                      onPressed: (() {}),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.language),
                            color: Colors.grey,
                            onPressed: () {},
                          ),
                          Text(
                            "Language",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ))),
              // Padding(
              //   padding: const EdgeInsets.only(left: 50.0),
              //   child: ListTileSwitch(
              //     value: themeChange.darkTheme,
              //     leading: SizedBox(
              //         height: 23, child: Image.asset("assets/images/imag.png")),
              //     onChanged: (value) {
              //       setState(() {
              //         themeChange.darkTheme = value;
              //       });
              //     },
              //     visualDensity: VisualDensity.comfortable,
              //     switchType: SwitchType.cupertino,
              //     switchActiveColor: Colors.indigo,
              //     title: Text(
              //       'Theme',
              //       style: TextStyle(color: Colors.black),
              //     ),
              //   ),
              // ),
            ]),
          ),
          Container(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      " Account",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 26),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 45.0, right: 8, top: 0, bottom: 8),
                  child: Container(
                    child: TextButton(
                        onPressed: (() {}),
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        child: Icon(Icons.lock,
                                            color: Colors.grey)),
                                  )),
                              Expanded(
                                  child: Text(
                                "Change password",
                                style: TextStyle(color: Colors.black),
                              )),
                            ],
                          ),
                        )),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 47.0, right: 8),
                child: Container(
                  child: TextButton(
                    onPressed: () async {
                      // Navigator.pop(context);
                      // await _auth.signOut().then((value) => Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Loginpage())));
                    },
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.logout),
                          color: Colors.grey,
                          onPressed: () {
                            _signOut();
                          },
                        ),
                        Text(
                          "Log out",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
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
        myEmail = ds.data()!['name'];
        print(myEmail);
      }).catchError((e) {
        print(e);
      });
  }
}
