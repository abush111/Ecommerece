import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Login/Login.dart';
import 'package:flutterapp/Login/Themeheloer.dart';
import 'package:flutterapp/Register/firebase.dart';
import 'package:flutterapp/main.dart';
import 'package:flutterapp/route/route.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Login/Theme.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  var selectRole;
  String? selectedItem = 'Electrician';
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController cityname = TextEditingController();
  TextEditingController housename = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isHiddenPassword = true;
  List<String> items = ['Users', 'Electrician'];
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success!!!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Registration Completed Successfully! '),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => LoginPage()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _passwordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(selectRole);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.center,
              child: selectedItem == "Users"
                  ? Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 5, color: Colors.white),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 20,
                                        offset: const Offset(5, 5),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.grey.shade300,
                                    size: 80.0,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                  child: Icon(
                                    Icons.add_circle,
                                    color: Colors.grey.shade700,
                                    size: 25.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Your First Name';
                                }
                                return null;
                              },
                              controller: firstname,
                              decoration: ThemeHelper().textInputDecoration(
                                  'First Name', 'Enter your first name'),
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Your Last  Name';
                                }
                                return null;
                              },
                              controller: lastname,
                              decoration: ThemeHelper().textInputDecoration(
                                  'Last Name', 'Enter your last name'),
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFormField(
                              controller: cityname,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter city';
                                }
                                return null;
                              },
                              decoration: ThemeHelper().textInputDecoration(
                                  'City', 'Enter your City'),
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Your house number';
                                }
                                return null;
                              },
                              controller: housename,
                              decoration: ThemeHelper().textInputDecoration(
                                  'House number', 'Enter House number'),
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFormField(
                              controller: phone,
                              decoration: ThemeHelper().textInputDecoration(
                                  "Mobile Number", "Enter your mobile number"),
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please enter your phone";
                                }
                                return null;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFormField(
                              controller: email,
                              decoration: ThemeHelper().textInputDecoration(
                                  "E-mail address", "Enter your email"),
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please enter your email";
                                }
                                return null;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              controller: password,
                              validator: (value) {
                                if (value!.isEmpty || value.length < 6) {
                                  return 'Please Enter 6 character';
                                }
                                return null;
                              },
                              obscureText: isHiddenPassword,
                              decoration: ThemeHelper().textInputDecoration(
                                "Password*",
                                "Enter your password",
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isHiddenPassword = !isHiddenPassword;
                                    });
                                  },
                                  icon: Icon(
                                    isHiddenPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.lightBlue,
                                  ),
                                ),
                              ),

                              // validator: (val) {
                              //   if (val!.isEmpty) {
                              //     return "Please enter your password";
                              //   }
                              //   return null;
                              // },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [
                              Container(
                                child: Text(
                                  " Select role",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.info),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(" Register as:"),
                                ),
                                Container(
                                  color: Colors.white,
                                  height: 40,
                                  margin: EdgeInsets.only(
                                    left: 40,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: DropdownButton<String>(
                                    value: selectedItem,
                                    items: items
                                        .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            )))
                                        .toList(),
                                    onChanged: (item) {
                                      setState(() => selectedItem = item);
                                      selectRole = item;
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 40,
                            decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  "Sign Up".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: email.text,
                                          password: password.text)
                                      .then((signedInUser) async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString('email', email.text);
                                    prefs.setString('phone', phone.text);
                                    prefs.setString('name', firstname.text);
                                    var firebaseUser =
                                        await FirebaseAuth.instance.currentUser;
                                    userManagement().storeNewUser(
                                        email.text,
                                        firstname.text,
                                        phone.text,
                                        cityname.text,
                                        housename.text,
                                        selectedItem.toString(),
                                        firebaseUser!.uid);
                                  }).catchError((e) {
                                    print(e);
                                  });
                                  _showMyDialog();
                                  // Navigator.of(context)
                                  //     .pushNamed(AppRoutes.Signup);
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            //child: Text('Don\'t have an account? Create'),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: 'Sign IN',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, AppRoutes.Signup);
                                  },
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).accentColor),
                              ),
                            ])),
                          ),
                          // SizedBox(height: 30.0),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 30.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 5, color: Colors.white),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 20,
                                        offset: const Offset(5, 5),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.grey.shade300,
                                    size: 80.0,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                  child: Icon(
                                    Icons.add_circle,
                                    color: Colors.grey.shade700,
                                    size: 25.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Your First Name';
                                }
                                return null;
                              },
                              controller: firstname,
                              decoration: ThemeHelper().textInputDecoration(
                                  'First Name', 'Enter your first name'),
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Your Last  Name';
                                }
                                return null;
                              },
                              controller: lastname,
                              decoration: ThemeHelper().textInputDecoration(
                                  'Last Name', 'Enter your last name'),
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFormField(
                              controller: cityname,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter  city';
                                }
                                return null;
                              },
                              decoration: ThemeHelper().textInputDecoration(
                                  'City', 'Enter your City'),
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Your house number';
                                }
                                return null;
                              },
                              controller: housename,
                              decoration: ThemeHelper().textInputDecoration(
                                  'House number', 'Enter House number'),
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFormField(
                              controller: phone,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please enter your phone";
                                }
                                return null;
                              },
                              decoration: ThemeHelper().textInputDecoration(
                                  "Mobile Number", "Enter your mobile number"),
                              keyboardType: TextInputType.phone,
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFormField(
                              controller: email,
                              // validator: (val) =>
                              //     val!.isEmpty || !val.contains("@")
                              //         ? "Enter a valid eamil"
                              //         : null,
                              decoration: ThemeHelper().textInputDecoration(
                                  "E-mail address", "Enter your email"),
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please enter your email";
                                }
                                return null;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              controller: password,
                              validator: (value) {
                                if (value!.isEmpty || value.length < 6) {
                                  return 'Please Enter 6 character';
                                }
                                return null;
                              },
                              obscureText: isHiddenPassword,
                              decoration: ThemeHelper().textInputDecoration(
                                "Password*",
                                "Enter your password",
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isHiddenPassword = !isHiddenPassword;
                                    });
                                  },
                                  icon: Icon(
                                    isHiddenPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.lightBlue,
                                  ),
                                ),
                              ),
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  " Select role",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.info),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    " Register as:",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  height: 40,
                                  margin: EdgeInsets.only(
                                    left: 40,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: DropdownButton<String>(
                                    value: selectedItem,
                                    items: items
                                        .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            )))
                                        .toList(),
                                    onChanged: (item) {
                                      setState(() => selectedItem = item);
                                      selectRole = item;
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 40,
                            decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  "Sign Up".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: email.text,
                                          password: password.text)
                                      .then((signedInUser) async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString(
                                      'email',
                                      email.text,
                                    );
                                    prefs.setString('phone', phone.text);
                                    prefs.setString('name', firstname.text);
                                    var firebaseUser =
                                        await FirebaseAuth.instance.currentUser;
                                    userManagement().storeNewUser(
                                        email.text,
                                        firstname.text,
                                        phone.text,
                                        cityname.text,
                                        housename.text,
                                        selectedItem.toString(),
                                        firebaseUser!.uid);
                                  }).catchError((e) {
                                    print(e);
                                  });
                                  _showMyDialog();
                                  setState(() {
                                    //<-- Clear at the end
                                  });
                                  // Navigator.of(context)
                                  //     .pushNamed(AppRoutes.Signup);
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            //child: Text('Don\'t have an account? Create'),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: 'Sign IN',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, AppRoutes.Signup);
                                  },
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Theme.of(context).accentColor),
                              ),
                            ])),
                          ),
                          // SizedBox(height: 30.0),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
