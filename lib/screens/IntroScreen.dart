// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:demo/screens/AuthenticationScreens/Login.dart';
import 'package:demo/screens/AuthenticationScreens/Signup.dart';
import 'package:demo/screens/AuthenticationScreens/Signupdetails.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
            child: Container(
              height: 130,
              width: 150,
              child: Text('Login'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SignupScreen.id);
            },
            child: Container(
              height: 130,
              width: 150,
              child: Text('Signin'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SignupDetails.id);
            },
            child: Container(
              height: 130,
              width: 150,
              child: Text('Signup'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
