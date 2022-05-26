import 'package:demo/screens/StudentScreen/generateOrSubmit.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../constants.dart';
import 'StudentHome.dart';
import 'StudentReusable.dart';
import 'createSHA.dart';

BuildContext tempContext;

class StudentClassScreen extends StatefulWidget {
  static String id = "StudentClassScreen";
  String classname = "";
  String classId = "";
  @override
  State<StudentClassScreen> createState() => _StudentClassScreenState();
  StudentClassScreen(this.classname, this.classId);
}

class _StudentClassScreenState extends State<StudentClassScreen> {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    tempContext = context;
    List<Widget> assigned = [], completed = [];
    try {
      if (completedAssignment.length != 0) {
        for (int i = 0; i < completedAssignment.length; i++) {
          completed.add(AssignemntCard(
            name: completedAssignment[i].assignmentName,
            date: completedAssignment[i].endDate,
            time: completedAssignment[i].endTime,
            duration: completedAssignment[i].duration ?? ' ',
            press: () {},
          ));
        }
      }
      if (assignedAssignment.length != 0) {
        for (int i = 0; i < assignedAssignment.length; i++) {
          assigned.add(AssignemntCard(
            name: assignedAssignment[i].assignmentName,
            date: assignedAssignment[i].endDate,
            time: assignedAssignment[i].endTime,
            duration: assignedAssignment[i].duration ?? ' ',
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => generateOrSubmit(
                        widget.classId,
                        widget.classname + assignedAssignment[i].assignmentName,
                        assignedAssignment[i].link,
                        assignedAssignment[i].assignmentName),
                  ));
            },
          ));
        }
      }
      assigned.add(SizedBox(
        height: 15,
      ));
      completed.add(SizedBox(
        height: 15,
      ));
    } catch (e) {
      print(e);
      assigned.add(SizedBox(
        height: 15,
      ));
      completed.add(SizedBox(
        height: 15,
      ));
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: ListView(
          children: [
            Column(
              children: [
                HeadingText(text: "Assigned"),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: assigned,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                HeadingText(text: "Completed"),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: completed,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
