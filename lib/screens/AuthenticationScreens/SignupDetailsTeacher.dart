// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:demo/screens/TeacherHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants.dart';

class SignupDetailsTeacher extends StatefulWidget {
  static const String id = "SignupDetailsTeacher";
  @override
  _SignupDetailsTeacherState createState() => _SignupDetailsTeacherState();
}

class _SignupDetailsTeacherState extends State<SignupDetailsTeacher> {
  String _name, _eid, _department, _contactNum;
  // final _firestore = FirebaseFirestore.instance;
  // final _auth = FirebaseAuth.instance;
  // User loggedInUser;

  void getCurrentUser() async {
    // try {
    //   // final user = _auth.currentUser;
    //   if (user != null) {
    //     // loggedInUser = user;
    //   }
    // } catch (e) {
    //   print(e);
    // }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

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
                Container(
                  height: 75.0,
                  width: 75.0,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(height: 30.0),
                Text(
                  "User Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: primaryColour,
                  ),
                ),
                SizedBox(height: 40.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
                  child: Container(
                    child: TextField(
                      onChanged: (value) {
                        _name = value;
                      },
                      cursorColor: primaryColour,
                      style: TextStyle(color: Colors.grey.shade600),
                      decoration: InputDecoration(
                        labelText: "NAME",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                        ),
                        hintText: "Enter your Name",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
                  child: Container(
                    child: TextField(
                      onChanged: (value) {
                        _eid = value;
                      },
                      cursorColor: primaryColour,
                      style: TextStyle(color: Colors.grey.shade600),
                      decoration: InputDecoration(
                        labelText: "Employee ID",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                        ),
                        hintText: "Enter your ID",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
                  child: Container(
                    child: TextField(
                      onChanged: (value) {
                        _contactNum = value;
                      },
                      keyboardType: TextInputType.number,
                      cursorColor: primaryColour,
                      style: TextStyle(color: Colors.grey.shade600),
                      decoration: InputDecoration(
                        labelText: "CONTACT NUMBER",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                        ),
                        hintText: "Enter your 10-digit Number",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
                  child: Container(
                    child: TextField(
                      onChanged: (value) {
                        _department = value;
                      },
                      keyboardType: TextInputType.number,
                      cursorColor: primaryColour,
                      style: TextStyle(color: Colors.grey.shade600),
                      decoration: InputDecoration(
                        labelText: "Department",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                        ),
                        hintText: "Enter your department",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherHome()));
                    },
                    //   onTap: () async {
                    //     if (_name != null &&
                    //         _address != null &&
                    //         _contactNum != null &&
                    //         _aadhar != null &&
                    //         _panId != null &&
                    //         _contactNum.length == 10 &&
                    //         _aadhar.length == 12 &&
                    //         _panId.length == 10) {
                    //       final SharedPreferences sharedPref =
                    //           await SharedPreferences.getInstance();
                    //       sharedPref.setString(USER_NAME, _name);
                    //       sharedPref.setString(USER_ADDRESS, _address);
                    //       sharedPref.setString(USER_CONTACT, _contactNum);
                    //       sharedPref.setString(USER_PANID, _panId);
                    //       sharedPref.setString(USER_AADHAR, _aadhar);
                    //       sharedPref.setString(USER_PROPERTY_COUNT, "0");
                    //       sharedPref.setString(USER_DP_LINK, _photoUrl);
                    //       _firestore
                    //           .collection(USER_COLLECTION)
                    //           .doc(FirebaseAuth.instance.currentUser.uid)
                    //           .set({
                    //         USER_EMAIL: loggedInUser.email,
                    //         USER_NAME: _name,
                    //         USER_ADDRESS: _address,
                    //         USER_CONTACT: _contactNum,
                    //         USER_PANID: _panId,
                    //         USER_AADHAR: _aadhar,
                    //         USER_PROPERTY_COUNT: "0",
                    //         USER_DP_LINK: _photoUrl,
                    //       });
                    //       Navigator.of(context).pushNamedAndRemoveUntil(
                    //           NavigationScreen.id,
                    //           (Route<dynamic> route) => false);
                    //     } else {
                    //       if (_contactNum.length != 10) {
                    //         Alert(
                    //                 context: context,
                    //                 title:
                    //                     "Your phone number should be 10 digits long",
                    //                 buttons: [
                    //                   DialogButton(
                    //                     child: Text(
                    //                       "CANCEL",
                    //                       style: TextStyle(
                    //                         color: Colors.white,
                    //                         fontSize: 20.0,
                    //                       ),
                    //                     ),
                    //                     onPressed: () => Navigator.pop(context),
                    //                     color: primaryColour,
                    //                     width: 150.0,
                    //                     radius: BorderRadius.circular(15.0),
                    //                   ),
                    //                 ],
                    //                 desc: "Please Re-enter")
                    //             .show();
                    //       } else if (_aadhar.length != 12) {
                    //         Alert(
                    //                 context: context,
                    //                 title:
                    //                     "Your Aadhar Number should be 12 digits long",
                    //                 buttons: [
                    //                   DialogButton(
                    //                     child: Text(
                    //                       "CANCEL",
                    //                       style: TextStyle(
                    //                         color: Colors.white,
                    //                         fontSize: 20.0,
                    //                       ),
                    //                     ),
                    //                     onPressed: () => Navigator.pop(context),
                    //                     color: primaryColour,
                    //                     width: 150.0,
                    //                     radius: BorderRadius.circular(15.0),
                    //                   ),
                    //                 ],
                    //                 desc: "Please Re-enter")
                    //             .show();
                    //       } else if (_panId.length != 10) {
                    //         Alert(
                    //                 context: context,
                    //                 title: "Your Pan Id should be 10 digits long",
                    //                 buttons: [
                    //                   DialogButton(
                    //                     child: Text(
                    //                       "CANCEL",
                    //                       style: TextStyle(
                    //                         color: Colors.white,
                    //                         fontSize: 20.0,
                    //                       ),
                    //                     ),
                    //                     onPressed: () => Navigator.pop(context),
                    //                     color: primaryColour,
                    //                     width: 150.0,
                    //                     radius: BorderRadius.circular(15.0),
                    //                   ),
                    //                 ],
                    //                 desc: "Please Re-enter")
                    //             .show();
                    //       }
                    //     }
                    //   },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
