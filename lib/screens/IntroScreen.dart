// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:demo/constants.dart';
import 'package:demo/screens/AuthenticationScreens/LoginStudent.dart';
import 'package:demo/screens/AuthenticationScreens/LoginTeacher.dart';
import 'package:demo/screens/AuthenticationScreens/SignupDetailsTeacher.dart';
import 'package:demo/screens/AuthenticationScreens/SignupStudent.dart';
import 'package:demo/screens/AuthenticationScreens/SignupDetailsStudent.dart';
import 'package:demo/screens/AuthenticationScreens/SignupTeacher.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [kPrimaryColor, Colors.white],
              ),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/classroom.png",
                      height: 180,
                      width: 180,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, LoginTeacherScreen.id);
                            },
                            child: Container(
                              height: buttonHeight,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF2a617a),
                                    blurRadius: 10.0,
                                    spreadRadius: 0.0,
                                    // shadow direction: bottom right
                                  )
                                ],
                                border: Border.all(color: Color(0xFF2a617a)),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [kPrimaryColor, Color(0xFF64abc9)],
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  "Log in",
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
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SignupScreenTeacher.id);
                            },
                            child: Container(
                              height: buttonHeight,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF2a617a),
                                    blurRadius: 10.0,
                                    spreadRadius: 0.0,
                                    // shadow direction: bottom right
                                  )
                                ],
                                border: Border.all(color: Color(0xFF2a617a)),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [kPrimaryColor, Color(0xFF64abc9)],
                                ),
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
                    )
                  ],
                ),
                SizedBox(height: 100),
                Column(
                  children: [
                    Image.asset(
                      "assets/student.png",
                      height: 180,
                      width: 180,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, LoginStudentScreen.id);
                            },
                            child: Container(
                              height: buttonHeight,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF2a617a),
                                    blurRadius: 10.0,
                                    spreadRadius: 0.0,
                                    // shadow direction: bottom right
                                  )
                                ],
                                border: Border.all(color: Color(0xFF2a617a)),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [kPrimaryColor, Color(0xFF64abc9)],
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  "Log in",
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
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SignupScreenStudent.id);
                            },
                            child: Container(
                              height: buttonHeight,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF2a617a),
                                    blurRadius: 10.0,
                                    spreadRadius: 0.0,
                                    // shadow direction: bottom right
                                  )
                                ],
                                border: Border.all(color: Color(0xFF2a617a)),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [kPrimaryColor, Color(0xFF64abc9)],
                                ),
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
