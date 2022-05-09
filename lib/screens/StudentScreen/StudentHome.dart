import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/screens/StudentScreen/StudentProfile.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../constants.dart';
import 'StudentReusable.dart';

BuildContext tempContext;

class StudentHome extends StatefulWidget {
  static const String id = "StudentHome";

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  final primaryColor = Color(0xFF192A56);
  String _classid;
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }
  @override
  Widget build(BuildContext context) {
    tempContext = context;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HeadingText(text: "My Classes"),
            ClassCard(
                path: "",
                className: "Data Structrue and Algoritms",
                department: "CSE",
                batch: "2k19"),
            ClassCard(
                path: "",
                className: "Data Structrue and Algoritms",
                department: "CSE",
                batch: "2k19"),
          ],
        ),
        backgroundColor: kPrimaryColor,
        floatingActionButton: _getFAB(),
      ),
    );
  }

  Widget _getFAB() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, right: 15, top: 0, left: 0),
      child: SpeedDial(
        overlayColor: Colors.transparent,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22),
        backgroundColor: kPrimaryColor,
        visible: true,
        // curve: Curves.bounceIn,
        children: [
          // FAB 1
          SpeedDialChild(
            child: Icon(Icons.add_circle_outline, color: kPrimaryColor),
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Join a class'),
                  content: TextField(
                    onChanged: (value) {
                      _classid = value;
                    },
                    cursorColor: kPrimaryColor,
                    style: TextStyle(color: Colors.grey.shade600),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade700),
                      ),
                      hintText: "Enter class code",
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        if(_classid!=null){
                          _firestore.collection("AUTH_DATA")
                              .doc("STUDENT")
                              .collection(FirebaseAuth.instance.currentUser.uid)
                              .doc("Class_List")
                              .collection("Classes")
                              .doc(_classid)
                              .set({
                            "Class id": _classid,
                          });
                        }
                        if(_classid!=null){
                          _firestore.collection("Classes").doc(_classid)
                              .collection("Student_List")
                              .add({
                            "Student_id": FirebaseAuth.instance.currentUser.uid,
                          });
                        }
                        Navigator.pop(context, 'OK');
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
              child: const Text('Show Dialog');
            },
            label: 'Join a Class',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: kPrimaryColor,
          ),
          // FAB 2
          SpeedDialChild(
              child: Icon(Icons.person, color: kPrimaryColor),
              onTap: () {
                Navigator.pushNamed(tempContext, StudentProfile.id);
              },
              label: 'Profile',
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 16.0),
              labelBackgroundColor: kPrimaryColor),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1000),
    ));
  }
}
