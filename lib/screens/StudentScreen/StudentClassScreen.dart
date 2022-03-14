import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../constants.dart';
import 'StudentReusable.dart';

BuildContext tempContext;

class StudentClassScreen extends StatefulWidget {
  static String id = "StudentClassScreen";
  @override
  State<StudentClassScreen> createState() => _StudentClassScreenState();
}

class _StudentClassScreenState extends State<StudentClassScreen> {
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
                    ],
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
