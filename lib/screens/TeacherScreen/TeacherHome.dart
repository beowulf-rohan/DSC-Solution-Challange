import 'package:flutter/material.dart';

class TeacherHome extends StatefulWidget {
  static const String id = "TeacherHome";
  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Teacher'),
      ),
    );
  }
}