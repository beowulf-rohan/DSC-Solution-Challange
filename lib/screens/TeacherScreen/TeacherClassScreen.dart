import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'TeacherReusable.dart';

class TeacherClassScreen extends StatefulWidget {
  static String id = "TeacherClassScreen";
  @override
  State<TeacherClassScreen> createState() => _TeacherClassScreenState();
}

class _TeacherClassScreenState extends State<TeacherClassScreen> {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Column(
          children: [
            HeadingText(text: "My Assignments"),
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
    );
  }
}
