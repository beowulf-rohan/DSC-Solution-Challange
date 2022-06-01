import 'dart:async';

import 'package:demo/constants.dart';
import 'package:demo/screens/AuthenticationScreens/LoginStudent.dart';
import 'package:demo/screens/AuthenticationScreens/LoginTeacher.dart';
import 'package:demo/screens/IntroScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'StudentScreen/StudentHome.dart';
import 'TeacherScreen/TeacherHome.dart';

String finalEmail, konhai;
Widget home = IntroScreen();

class transition extends StatefulWidget {
  @override
  State<transition> createState() => _transitionState();
}

Future getValidation() async {
  final SharedPreferences sharedPref = await SharedPreferences.getInstance();
  if (sharedPref.getString('TEACHER_USER_EMAIL') != null) {
    finalEmail = sharedPref.getString('TEACHER_USER_EMAIL');
    konhai = "TEACHER";
  } else if (sharedPref.getString('STUDENT_USER_EMAIL') != null) {
    finalEmail = sharedPref.getString('STUDENT_USER_EMAIL');
    konhai = "STUDENT";
  }
}

Future<void> resetNewLaunch() async {
  getValidation().whenComplete(() async {
    if (finalEmail != null && konhai == "TEACHER") {
      await getData().then((value) => {null});
      home = TeacherHome();
    } else if (finalEmail != null && konhai == "STUDENT") {
      await getStudentData().then((value) => {null});
      home = StudentHome();
    } else {
      home = IntroScreen();
    }
  });
}

class _transitionState extends State<transition> {
  bool showSpinner = false;

  Future<void> get() async {
    await resetNewLaunch().then((value) => null);
  }

  @override
  void initState() {
    super.initState();
    get();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => home,
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 250,
                  ),
                  SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset('images/google.png')),
                  SizedBox(height: 30.0),
                  Text(
                    'OFFLINE QUIZ',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Fredoka',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
