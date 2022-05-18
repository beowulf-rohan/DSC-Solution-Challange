// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/screens/AuthenticationScreens/SignupStudent.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../constants.dart';
import '../StudentScreen/StudentHome.dart';

class LoginStudentScreen extends StatefulWidget {
  static String id = "LoginStudentScreen";

  const LoginStudentScreen({Key key}) : super(key: key);
  @override
  _LoginStudentScreenState createState() => _LoginStudentScreenState();
}
final _firestore = FirebaseFirestore.instance;
List<classDetails> classList;
class _LoginStudentScreenState extends State<LoginStudentScreen> {
  String _emailVal, _passwordVal;
  bool _passwordVisible = false;
  String status;
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: 75.0,
                  width: 75.0,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(height: 30.0),
                Text(
                  "Log In",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSans',
                    fontSize: 40.0,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Log in with the data you have entered\nduring registration",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'NotoSans',
                  ),
                ),
                SizedBox(height: 40.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0),
                  child: Container(
                    child: TextField(
                      onChanged: (value) {
                        _emailVal = value;
                      },
                      cursorColor: kPrimaryColor,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontFamily: 'NotoSans',
                      ),
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                        ),
                        hintText: "Enter your Email",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0),
                  child: Container(
                    child: TextField(
                      onChanged: (value) {
                        _passwordVal = value;
                      },
                      cursorColor: kPrimaryColor,
                      obscureText: !_passwordVisible,
                      style: TextStyle(color: Colors.grey.shade600),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                        ),
                        hintText: "Enter your Password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          child: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, ForgotPassScreen.id);
                      },
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 0),
                  child: GestureDetector(
                    onTap: () async {
                      if (_emailVal != null && _passwordVal != null) {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          final oldUser =
                              await _auth.signInWithEmailAndPassword(
                                  email: _emailVal, password: _passwordVal);
                          if (oldUser != null) {
                            // final SharedPreferences sharedPref = await SharedPreferences.getInstance();
                            // sharedPref.setString(USER_EMAIL, _emailVal);
                            getData();
                            Timer(Duration(seconds: 3), () {
                              setState(() {
                                showSpinner = false;
                              });
                              Navigator.pushNamed(context, StudentHome.id);
                            });
                          }
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (error) {
                          print(error.code);
                          switch (error.code) {
                            case "invalid-email":
                              status = 'Invalid Email';
                              break;
                            case "wrong-password":
                              status = 'Wrong password';
                              break;
                            case "user-not-found":
                              status = 'User not found';
                              break;
                            case "email-already-exists":
                              status = 'Email already in use';
                              break;
                            case "too-many-requests":
                              status = 'Too many request';
                              break;
                            default:
                              status = 'Undefined error';
                              break;
                          }
                          setState(() {
                            showSpinner = false;
                          });
                          Alert(
                                  context: context,
                                  title: status,
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
                                  desc: "Please try again")
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
                          "Log In",
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
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignupScreenStudent.id);
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
Future<void> getData() async{
  classList = await fetchAllClasses() as List;
  print(classList);
}
Future<List<classDetails>> fetchAllClasses() async {
  List <classDetails> tempClasstList=[];
  List <String> classid=[];
  QuerySnapshot querySnapshot = await _firestore
      .collection('AUTH_DATA')
      .doc('STUDENT')
      .collection(FirebaseAuth.instance.currentUser.uid)
      .doc('Class_List').collection('Classes').get();
  querySnapshot.docs.forEach((element) {
    classid.add(element['Class id']);
  });
  for(int j=0;j<classid.length;j++){
    DocumentSnapshot document=await _firestore
        .collection('Classes')
        .doc(classid[j]).collection('Class_Details').doc('Info').get();
    classDetails obj=classDetails();
    obj.batch=document["Batch"];
    obj.classId=document["Class id"];
    obj.className=document["Class Name"];
    obj.dept=document["Department"];
    print(document["Class Name"]);
    tempClasstList.add(obj);
  }
  return tempClasstList;
}
class classDetails{
  String batch,className,classId,dept;
  classDetails({this.batch,this.className,this.classId,this.dept});
}
