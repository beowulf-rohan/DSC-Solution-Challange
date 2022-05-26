import 'package:demo/screens/TeacherScreen/TeacherReusable.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class TestResponses extends StatefulWidget {
  @override
  State<TestResponses> createState() => _TestResponsesState();
}

class _TestResponsesState extends State<TestResponses> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HeadingText(text: "Responses"),
            ResponseCard(),
          ],
        ),
        backgroundColor: kPrimaryColor,
      ),
    );
    ;
  }
}
