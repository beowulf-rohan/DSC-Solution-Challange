import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../TeacherScreen/TeacherReusable.dart';

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
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 10, right: 15, top: 0, left: 0),
          child: FabCircularMenu(
            key: fabKey,
            alignment: Alignment.bottomRight,
            ringColor: Colors.white,
            ringDiameter: 300.0,
            ringWidth: 75.0,
            fabSize: 60.0,
            fabElevation: 8.0,
            fabIconBorder: CircleBorder(),
            fabColor: Colors.white,
            fabOpenIcon: Icon(Icons.menu, color: kPrimaryColor),
            fabCloseIcon: Icon(Icons.close, color: kPrimaryColor),
            fabMargin: const EdgeInsets.all(16.0),
            animationDuration: const Duration(milliseconds: 800),
            animationCurve: Curves.easeInOutCirc,
            onDisplayChange: (isOpen) {
              //_showSnackBar(context, "The menu is ${isOpen ? "open" : "closed"}");
            },
            children: <Widget>[
              RawMaterialButton(
                onPressed: () {
                  // _showSnackBar(context, "You pressed 1");
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.info, size: 30, color: kPrimaryColor),
              ),
              RawMaterialButton(
                onPressed: () {
                  // _showSnackBar(context, "You pressed 2");
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(12.0),
                child:
                Icon(Icons.person_rounded, size: 30, color: kPrimaryColor),
              ),
              RawMaterialButton(
                onPressed: () {
                  //  _showSnackBar(context, "You pressed 3");
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.add_circle, size: 30, color: kPrimaryColor),
              ),
            ],
          ),
        ),
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
