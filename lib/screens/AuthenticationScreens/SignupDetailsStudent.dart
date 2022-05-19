// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/screens/StudentScreen/StudentHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../constants.dart';

class SignupDetailsStudent extends StatefulWidget {
  static const String id = "SignupDetailsStudent";
  @override
  _SignupDetailsStudentState createState() => _SignupDetailsStudentState();
}

class _SignupDetailsStudentState extends State<SignupDetailsStudent> {
  String _name, _roll, _department, _contactNum;
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  bool showSpinner=false;
  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 75.0,
                    width: 75.0,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    "User Details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
                    child: Container(
                      child: TextField(
                        onChanged: (value) {
                          _name = value;
                        },
                        cursorColor: kPrimaryColor,
                        style: TextStyle(color: Colors.grey.shade600),
                        decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade700),
                          ),
                          hintText: "Enter your Name",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
                    child: Container(
                      child: TextField(
                        onChanged: (value) {
                          _roll = value;
                        },
                        cursorColor: kPrimaryColor,
                        style: TextStyle(color: Colors.grey.shade600),
                        decoration: InputDecoration(
                          labelText: "Roll No",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade700),
                          ),
                          hintText: "Enter your ID",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
                    child: Container(
                      child: TextField(
                        onChanged: (value) {
                          _contactNum = value;
                        },
                        keyboardType: TextInputType.number,
                        cursorColor: kPrimaryColor,
                        style: TextStyle(color: Colors.grey.shade600),
                        decoration: InputDecoration(
                          labelText: "Contact Number",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade700),
                          ),
                          hintText: "Enter your 10-digit Number",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
                    child: Container(
                      child: TextField(
                        onChanged: (value) {
                          _department = value;
                        },
                        keyboardType: TextInputType.number,
                        cursorColor: kPrimaryColor,
                        style: TextStyle(color: Colors.grey.shade600),
                        decoration: InputDecoration(
                          labelText: "Department",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade700),
                          ),
                          hintText: "Enter your department",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 0),
                    child: GestureDetector(
                      onTap: () async {
                        if (_name != null &&
                            _roll != null &&
                            _department != null &&
                            _contactNum != null &&
                            _contactNum.length == 10) {
                          setState(() {
                            showSpinner=true;
                          });
                          _firestore
                              .collection("AUTH_DATA")
                              .doc("STUDENT")
                              .collection(FirebaseAuth.instance.currentUser.uid)
                              .doc("Student_Details")
                              .set({
                            STUDENT_EMAIL: loggedInUser.email,
                            STUDENT_NAME: _name,
                            STUDENT_CONTACT: _contactNum,
                            STUDENT_DEPARTMENT: _department,
                            STUDENT_CONTACT: _contactNum,
                            STUDENT_UID: loggedInUser.uid
                          });
                          setState(() {
                            showSpinner=false;
                          });
                          Navigator.pushNamed(context, StudentHome.id);
                          // Navigator.of(context).pushNamedAndRemoveUntil(
                          //     NavigationScreen.id,
                          //     (Route<dynamic> route) => false);
                        } else {
                          if (_contactNum.length != 10) {
                            Alert(
                                    context: context,
                                    title:
                                        "Your phone number should be 10 digits long",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "CANCEL",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: kPrimaryColor,
                                        width: 150.0,
                                        radius: BorderRadius.circular(15.0),
                                      ),
                                    ],
                                    desc: "Please Re-enter")
                                .show();
                          }
                        }
                      },
                      child: Container(
                        height: buttonHeight,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
