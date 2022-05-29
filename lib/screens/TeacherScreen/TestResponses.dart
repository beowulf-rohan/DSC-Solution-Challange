import 'package:demo/screens/TeacherScreen/TeacherReusable.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'TeacherClassScreen.dart';

class TestResponses extends StatefulWidget {
  @override
  State<TestResponses> createState() => _TestResponsesState();
}

class _TestResponsesState extends State<TestResponses> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> studentResponses = [];
    try {
      studentResponses.add(HeadingText(text: "Responses"));
      for (int i = 0; i < responsesRender.length; i++) {
        print(responsesRender[i].link);
        studentResponses.add(ResponseCard(
          name: responsesRender[i].name,
          roll: responsesRender[i].roll,
          link: responsesRender[i].link,
          check: responsesRender[i].checkSHA,
          context: context,
        ));
      }
    } catch (e) {
      print(e);
    }
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: studentResponses,
        ),
        backgroundColor: kPrimaryColor,
      ),
    );
    ;
  }
}
