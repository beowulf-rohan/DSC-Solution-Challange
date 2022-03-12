// ignore_for_file: prefer_const_constructors

import 'package:demo/screens/AuthenticationScreens/LoginStudent.dart';
import 'package:demo/screens/AuthenticationScreens/LoginTeacher.dart';
import 'package:demo/screens/AuthenticationScreens/SignupDetailsTeacher.dart';
import 'package:demo/screens/AuthenticationScreens/SignupStudent.dart';
import 'package:demo/screens/AuthenticationScreens/SignupDetailsStudent.dart';
import 'package:demo/screens/AuthenticationScreens/SignupTeacher.dart';
import 'package:demo/screens/IntroScreen.dart';
import 'package:demo/screens/StudentHome.dart';
import 'package:demo/screens/TeacherHome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroScreen(),
      routes: {
        // IntroScreen.id: (context) => IntroScreen(),
        LoginStudentScreen.id: (context) => LoginStudentScreen(),
        LoginTeacherScreen.id: (context) => LoginTeacherScreen(),
        SignupScreenStudent.id: (context) => SignupScreenStudent(),
        SignupScreenTeacher.id: (context) => SignupScreenTeacher(),
        SignupDetailsStudent.id: (context) => SignupDetailsStudent(),
        SignupDetailsTeacher.id: (context) => SignupDetailsTeacher(),
        TeacherHome.id: (context) => TeacherHome(),
        StudentHome.id: (context) => StudentHome(),
        // UpdateScreen.id: (context) => UpdateScreen(),
        // NavigationScreen.id: (context) => NavigationScreen(),
        // HomeScreen.id: (context) => HomeScreen(),
        // Addition1.id: (context) => Addition1(),
        // Addition2.id: (context) => Addition2(),
        // Addition3.id: (context) => Addition3(),
        // FAQ.id: (context) => FAQ(),
        // HelpLine.id: (context) => HelpLine(),
        // TermsAndConditions.id: (context) => TermsAndConditions(),
        // InfoScreen.id: (context) => InfoScreen(),
        // UserScreen.id: (context) => UserScreen(),
        // ForgotPassScreen.id: (context) => ForgotPassScreen(),
      },
    );
  }
}
