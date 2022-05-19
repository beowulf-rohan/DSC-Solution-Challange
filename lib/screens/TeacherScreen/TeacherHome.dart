import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/constants.dart';
import 'package:demo/screens/TeacherScreen/MakeNewClass.dart';
import 'package:demo/screens/TeacherScreen/TeacherProfile.dart';
import 'package:demo/screens/TeacherScreen/TeacherReusable.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../AuthenticationScreens/LoginTeacher.dart';

BuildContext tempContext;

class TeacherHome extends StatefulWidget {
  static const String id = "TeacherHome";
  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

final _firestore = FirebaseFirestore.instance;
List<AssignmentDetails> assignmentList = [];

//List<classDetails> classList;
class _TeacherHomeState extends State<TeacherHome> {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  //final primaryColor = Color(0xFF488fb1);
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
    //getData();
  }

  // Future<void> getData() async{
  //    classList = await fetchAllClasses() as List;
  // }
  @override
  Widget build(BuildContext context) {
    tempContext = context;
    List<Widget> card = [];
    try {
      card.add(HeadingText(text: "My Classes"));
      for (int j = 0; j < classList.length; j++) {
        card.add(ClassCard(
          path: classList[j].classId,
          className: classList[j].className,
          department: classList[j].dept,
          batch: classList[j].batch,
          context: context,
        ));
      }
    } catch (e) {
      print(e);
    }
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: card,
        ),
        backgroundColor: kPrimaryColor,
        floatingActionButton: _getFAB(),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1000),
    ));
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
              Navigator.pushNamed(tempContext, MakeNewClass.id);
            },
            label: 'Add Class',
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
                Navigator.pushNamed(tempContext, TeacherProfile.id);
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
}

Future<void> getAssignmentData(String classID, String className) async {
  assignmentList = await fetchAllAssignments(classID, className) as List;
  print(assignmentList);
}

Future<List<AssignmentDetails>> fetchAllAssignments(
    String classID, String className) async {
  List<AssignmentDetails> assignments = [];
  QuerySnapshot querySnapshot = await _firestore
      .collection('Classes')
      .doc(classID)
      .collection('Assignment_List')
      .get();
  querySnapshot.docs.forEach((element) {
    AssignmentDetails obj = AssignmentDetails();
    obj.assignmentName = element["Name"];
    obj.startTime = element["Start Time"];
    obj.startDate = element["Start Date"];
    obj.endTime = element["End Time"];
    obj.endDate = element["End Date"];
    obj.password = element["Password"];
    obj.link = element["Download Link"];
    print(element["Name"]);
    assignments.add(obj);
  });
  return assignments;
}

class AssignmentDetails {
  String assignmentName, startTime, startDate, endTime, endDate;
  String password, link;
}
