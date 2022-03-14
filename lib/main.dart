// ignore_for_file: prefer_const_constructors

import 'package:demo/screens/AuthenticationScreens/LoginStudent.dart';
import 'package:demo/screens/AuthenticationScreens/LoginTeacher.dart';
import 'package:demo/screens/AuthenticationScreens/SignupDetailsTeacher.dart';
import 'package:demo/screens/AuthenticationScreens/SignupStudent.dart';
import 'package:demo/screens/AuthenticationScreens/SignupDetailsStudent.dart';
import 'package:demo/screens/AuthenticationScreens/SignupTeacher.dart';
import 'package:demo/screens/IntroScreen.dart';
import 'package:demo/screens/StudentScreen/StudentClassScreen.dart';
import 'package:demo/screens/StudentScreen/StudentHome.dart';
import 'package:demo/screens/StudentScreen/StudentProfile.dart';
import 'package:demo/screens/TeacherScreen/AddAssignment.dart';
import 'package:demo/screens/TeacherScreen/AddStudentToClass.dart';
import 'package:demo/screens/TeacherScreen/MakeNewClass.dart';
import 'package:demo/screens/TeacherScreen/TeacherClassScreen.dart';
import 'package:demo/screens/TeacherScreen/TeacherHome.dart';
import 'package:demo/screens/TeacherScreen/TeacherProfile.dart';
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
      debugShowCheckedModeBanner: false,
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
        TeacherClassScreen.id: (context) => TeacherClassScreen(),
        StudentClassScreen.id: (context) => StudentClassScreen(),
        MakeNewClass.id: (context) => MakeNewClass(),
        AddStudentToClass.id: (context) => AddStudentToClass(),
        AddAAssignment.id: (context) => AddAAssignment(),
        TeacherProfile.id: (context) => TeacherProfile(),
        StudentProfile.id: (context) => StudentProfile(),
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
