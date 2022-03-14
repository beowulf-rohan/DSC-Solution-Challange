import 'package:demo/screens/StudentScreen/StudentProfile.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
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
            onTap: () {},
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
