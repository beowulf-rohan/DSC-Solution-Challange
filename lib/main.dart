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
import 'package:demo/screens/StudentScreen/createSHA.dart';
import 'package:demo/screens/StudentScreen/generateOrSubmit.dart';
import 'package:demo/screens/StudentScreen/submitPDF.dart';
import 'package:demo/screens/TeacherScreen/AddAssignment.dart';
import 'package:demo/screens/TeacherScreen/AddStudentToClass.dart';
import 'package:demo/screens/TeacherScreen/AssignmentInfo.dart';
import 'package:demo/screens/TeacherScreen/MakeNewClass.dart';
import 'package:demo/screens/TeacherScreen/TeacherClassScreen.dart';
import 'package:demo/screens/TeacherScreen/TeacherHome.dart';
import 'package:demo/screens/TeacherScreen/TeacherProfile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:shared_preferences/shared_preferences.dart';

String finalEmail, konhai;
Widget home = CircularProgressIndicator();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        //TeacherClassScreen.id: (context) => TeacherClassScreen(),
        //StudentClassScreen.id: (context) => StudentClassScreen(),
        MakeNewClass.id: (context) => MakeNewClass(),
        AddStudentToClass.id: (context) => AddStudentToClass(),
        //AddAAssignment.id: (context) => AddAAssignment(),
        TeacherProfile.id: (context) => TeacherProfile(),
        StudentProfile.id: (context) => StudentProfile(),
        generateOrSubmit.id: (context) => generateOrSubmit(),
        createSHA.id: (context) => createSHA(),
        submitPDF.id: (context) => submitPDF(),
        // AssignmentInfo.id: (context) => AssignmentInfo(),
      },
    );
  }
}
/*
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getValidation().whenComplete(() {
      if (finalEmail != null && konhai == "TEACHER") {
        home = TeacherHome();
      } else if (finalEmail != null && konhai == "STUDENT") {
        home = StudentHome();
      } else {
        home = IntroScreen();
      }
    });
    super.initState();
  }

  Future getValidation() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String email;
    if (sharedPref.getString('TEACHER_USER_EMAIL') != null) {
      email = sharedPref.getString('TEACHER_USER_EMAIL');
      konhai = "TEACHER";
    } else if (sharedPref.getString('STUDENT_USER_EMAIL') != null) {
      email = sharedPref.getString('STUDENT_USER_EMAIL');
      konhai = "STUDENT";
    }
    setState(() {
      finalEmail = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return home;
  }
}
*/
