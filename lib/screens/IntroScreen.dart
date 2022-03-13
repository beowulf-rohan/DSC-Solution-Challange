// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:demo/screens/AuthenticationScreens/LoginStudent.dart';
import 'package:demo/screens/AuthenticationScreens/LoginTeacher.dart';
import 'package:demo/screens/AuthenticationScreens/SignupDetailsTeacher.dart';
import 'package:demo/screens/AuthenticationScreens/SignupStudent.dart';
import 'package:demo/screens/AuthenticationScreens/SignupDetailsStudent.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, LoginStudentScreen.id);
              },
              child: Container(
                height: 130,
                width: 150,
                child: Text('LoginStudent'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, LoginTeacherScreen.id);
              },
              child: Container(
                height: 130,
                width: 150,
                child: Text('LoginTeacher'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SignupScreenStudent.id);
              },
              child: Container(
                height: 130,
                width: 150,
                child: Text('SignupStudent'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SignupDetailsTeacher.id);
              },
              child: Container(
                height: 130,
                width: 150,
                child: Text('SigninTeacher'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
