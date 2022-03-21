import 'package:demo/screens/TeacherScreen/AddAssignment.dart';
import 'package:demo/screens/TeacherScreen/AddStudentToClass.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../constants.dart';
import 'TeacherReusable.dart';

BuildContext tempContext;

class TeacherClassScreen extends StatefulWidget {
  static String id = "TeacherClassScreen";
  @override
  State<TeacherClassScreen> createState() => _TeacherClassScreenState();
}

class _TeacherClassScreenState extends State<TeacherClassScreen> {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    tempContext = context;
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
                    children: [
                      AssignemntCard(
                          name: 'ABC1',
                          date: '13-03-2022',
                          time: '3:21PM',
                          duration: '1 hours',
                          response: '30/60'),
                      AssignemntCard(
                          name: 'ABC2',
                          date: '16-03-2022',
                          time: '5:21AM',
                          duration: '3 hours',
                          response: '20/60'),
                      AssignemntCard(
                          name: 'ABC2',
                          date: '16-03-2022',
                          time: '5:21AM',
                          duration: '3 hours',
                          response: '20/60'),
                      SizedBox(
                        height: 15,
                      )
                    ],
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
                    children: [
                      AssignemntCard(
                          name: 'ABC1',
                          date: '13-03-2022',
                          time: '3:21PM',
                          duration: '1 hours',
                          response: '30/60'),
                      AssignemntCard(
                          name: 'ABC2',
                          date: '16-03-2022',
                          time: '5:21AM',
                          duration: '3 hours',
                          response: '20/60'),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: _getFAB(),
      ),
    );
  }
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
          child: Icon(Icons.person_add, color: kPrimaryColor),
          onTap: () {
            /* do anything */
            Navigator.pushNamed(tempContext, AddStudentToClass.id);
          },
          label: 'Add Student',
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.0),
          labelBackgroundColor: kPrimaryColor,
        ),
        // FAB 2
        SpeedDialChild(
            child: Icon(Icons.assignment, color: kPrimaryColor),
            onTap: () {
              Navigator.pushNamed(tempContext, AddAAssignment.id);
            },
            label: 'Add Assignment',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: kPrimaryColor),
      ],
    ),
  );
}
