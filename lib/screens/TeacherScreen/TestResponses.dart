import 'package:demo/screens/TeacherScreen/TeacherReusable.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'TeacherClassScreen.dart';

class TestResponses extends StatefulWidget {
  @override
  State<TestResponses> createState() => _TestResponsesState();
}

List<Widget> studentResponses = [];

class _TestResponsesState extends State<TestResponses> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    try {
      studentResponses.add(HeadingText(text: "Responses"));
      for (int i = 0; i < responsesRender.length; i++) {
        studentResponses.add(ResponseCard(
          name: responsesRender[i].name,
          roll: responsesRender[i].roll,
          link: responsesRender[i].link,
          check: responsesRender[i].checkSHA,
        ));
      }
    } catch (e) {
      print(e);
    }
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: studentResponses,
        ),
        backgroundColor: kPrimaryColor,
      ),
    );
    ;
  }
}
