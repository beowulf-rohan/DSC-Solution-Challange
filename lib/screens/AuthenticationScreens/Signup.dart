// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:demo/screens/AuthenticationScreens/Login.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class SignupScreen extends StatefulWidget {
  static String id = "SignupScreen";

  SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // String _emailVal, _passwordVal, _confirmPasswordVal;
  bool _passwordVisible1 = false, _passwordVisible2 = false;
  String status;
  bool showSpinner = false;
  // final _auth = FirebaseAuth.instance;

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
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: primaryColour,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "If yoy are a new user\nregister here",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: 40.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0),
                  child: Container(
                    child: TextField(
                      onChanged: (value) {
                        // _emailVal = value;
                      },
                      cursorColor: primaryColour,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.grey.shade600),
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
                        // _passwordVal = value;
                      },
                      cursorColor: primaryColour,
                      obscureText: !_passwordVisible1,
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
                              _passwordVisible1 = !_passwordVisible1;
                            });
                          },
                          child: Icon(
                            _passwordVisible1
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey.shade700,
                          ),
                        ),
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
                        // _confirmPasswordVal = value;
                      },
                      cursorColor: primaryColour,
                      obscureText: !_passwordVisible2,
                      style: TextStyle(color: Colors.grey.shade600),
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                        ),
                        hintText: "Re-enter your Password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _passwordVisible2 = !_passwordVisible2;
                            });
                          },
                          child: Icon(
                            _passwordVisible2
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
                  padding: const EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 0),
                  child: GestureDetector(
                    onTap: () async {},
                    child: Container(
                      height: buttonHeight,
                      decoration: BoxDecoration(
                        color: primaryColour,
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
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: primaryColour),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: primaryColour,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
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
