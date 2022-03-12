import 'package:demo/screens/AuthenticationScreens/Login.dart';
import 'package:demo/screens/AuthenticationScreens/Signup.dart';
import 'package:demo/screens/AuthenticationScreens/Signupdetails.dart';
import 'package:demo/screens/IntroScreen.dart';
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
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        SignupDetails.id: (context) => SignupDetails(),
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
