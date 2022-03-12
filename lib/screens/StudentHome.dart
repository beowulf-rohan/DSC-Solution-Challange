import 'package:flutter/material.dart';

class StudentHome extends StatefulWidget {
  static const String id = "StudentHome";

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Studnet'),
      ),
    );
  }
}
