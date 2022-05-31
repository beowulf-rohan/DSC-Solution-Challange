import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/screens/StudentScreen/submitPDF.dart';
import 'package:demo/screens/TeacherScreen/AddAssignment.dart';
import 'package:demo/screens/TeacherScreen/AddStudentToClass.dart';
import 'package:demo/screens/TeacherScreen/AssignmentInfo.dart';
import 'package:demo/screens/TeacherScreen/TeacherHome.dart';
import 'package:demo/screens/TeacherScreen/TestResponses.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import '../../constants.dart';
import 'TeacherReusable.dart';
import 'package:twilio_flutter/src/models/sent_sms_data.dart';

BuildContext tempContext;

class TeacherClassScreen extends StatefulWidget {
  static String id = "TeacherClassScreen";
  String classname = "";
  String classId = "";
  @override
  State<TeacherClassScreen> createState() => _TeacherClassScreenState();
  TeacherClassScreen(this.classname, this.classId);
}

final _firestore = FirebaseFirestore.instance;
List<ResponseOfStudent> responsesRender = [];

class _TeacherClassScreenState extends State<TeacherClassScreen> {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    tempContext = context;
    List<Widget> assigned = [], completed = [];
    try {
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
                    builder: (context) => AssignmentInfo(
                        assignedAssignment[i].assignmentName,
                        assignedAssignment[i].endDate,
                        assignedAssignment[i].endTime,
                        assignedAssignment[i].duration ?? ' ',
                        assignedAssignment[i].link,
                        assignedAssignment[i].studentContact,
                        assignedAssignment[i].password),
                  ));
            },
          ));
        }
      }
      if (completedAssignment.length != 0) {
        for (int i = 0; i < completedAssignment.length; i++) {
          completed.add(AssignemntCard(
            name: completedAssignment[i].assignmentName,
            date: completedAssignment[i].endDate,
            time: completedAssignment[i].endTime,
            duration: completedAssignment[i].duration ?? ' ',
            press: () async {
              try {
                await getResponseList(
                        widget.classId,
                        completedAssignment[i].assignmentName,
                        completedAssignment[i].end)
                    .then((value) => null);
              } catch (e) {
                print(e);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Failed to load student responses'),
                ));
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestResponses(),
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
        floatingActionButton: _getFAB(context, widget.classname),
      ),
    );
  }
}

Widget _getFAB(BuildContext context, String classname) {
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
        // FAB 2
        SpeedDialChild(
            child: Icon(Icons.assignment, color: kPrimaryColor),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddAAssignment(classname, classId),
                  ));
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

Future<void> getResponseList(
    String classId, String assignmentName, DateTime end) async {
  responsesRender.clear();
  TwilioFlutter twilioFlutter;
  twilioFlutter = TwilioFlutter(
      accountSid:
          'AC79b4aafe764eb646bac829cd4097d4bf', // replace *** with Account SID
      authToken:
          '26bffad6f171a3ad864413801c799d12', // replace xxx with Auth Token
      twilioNumber: '+16083363649' // replace .... with Twilio Number
      );
  SentSmsData data = await twilioFlutter.getSmsList();
  // print(data.messages);
  List<Message> messages = [];
  for (int j = 0; j < data.messages.length; j++) {
    if (data.messages[j].direction == "inbound" &&
        data.messages[j].body.length > 94) {
      messages.add(data.messages[j]);
    }
  }
  HashMap responses = new HashMap<String, String>();
  HashMap timeDiffrences = new HashMap<String, int>();
  for (int j = 0; j < messages.length; j++) {
    // print(messages[j].body);
    // print(messages[j].body.length);
    String shaKey = messages[j].body.substring(0, 64);
    String studentId = messages[j].body.substring(65, 93);
    String tempClassId = "";
    int k = 94;
    while (messages[j].body[k] != '%') {
      tempClassId += messages[j].body[k];
      k++;
    }
    k++;
    String tempAssignmentName = "";
    while (k < messages[j].body.length) {
      tempAssignmentName += messages[j].body[k];
      k++;
    }
    if (tempClassId == classId && tempAssignmentName == assignmentName) {
      DateTime sentDateTime = convertStringToDateTime(messages[j].dateSent);
      DateTime now = DateTime.now();
      int diff = now.difference(sentDateTime).inSeconds;
      if (responses.containsKey(studentId)) {
        if (timeDiffrences[studentId] > diff) {
          timeDiffrences[studentId] = diff;
          responses[studentId] = shaKey;
        }
      } else {
        responses[studentId] = shaKey;
        timeDiffrences[studentId] = diff;
      }
    }
    // print(shaKey);
    // print(studentId);
    // print(tempClassId);
    // print(tempAssignmentName);
  }
  HashMap links = new HashMap<String, String>();
  HashMap timeOfSubmission = new HashMap<String, DateTime>();
  HashMap shaForCheck = new HashMap<String, String>();
  QuerySnapshot q2 = await _firestore
      .collection('Classes')
      .doc(classId)
      .collection('Assignment_List')
      .doc(assignmentName)
      .collection('Submissions')
      .get();
  q2.docs.forEach((element) {
    links[element['Student_id']] = element['Download Link'];
    timeOfSubmission[element['Student_id']] =
        DateTime.parse(element['Submission Time']);
    shaForCheck[element['Student_id']] = element['SHA'];
  });
  QuerySnapshot querySnapshot = await _firestore
      .collection('Classes')
      .doc(classId)
      .collection('Student_List')
      .get();
  querySnapshot.docs.forEach((element) {
    ResponseOfStudent responseOfStudent = new ResponseOfStudent();
    responseOfStudent.uid = element['Student_id'];
    responseOfStudent.name = element['Name'];
    responseOfStudent.roll = element["Roll"];
    responseOfStudent.sha =
        shaForCheck.putIfAbsent(element['Student_id'], () => null);
    responseOfStudent.submitTime =
        timeOfSubmission.putIfAbsent(element['Student_id'], () => null);
    ;
    responseOfStudent.link =
        links.putIfAbsent(element['Student_id'], () => null);
    if (responseOfStudent.link != null) {
      if (responses.containsKey(responseOfStudent.uid)) {
        if (responses[responseOfStudent.uid] == responseOfStudent.sha) {
          responseOfStudent.checkSHA = true;
        } else {
          responseOfStudent.checkSHA = false;
        }
      } else {
        if (end.isBefore(responseOfStudent.submitTime)) {
          responseOfStudent.checkSHA = false;
        } else {
          responseOfStudent.checkSHA = true;
        }
      }
    } else {
      responseOfStudent.checkSHA = false;
    }
    responsesRender.add(responseOfStudent);
  });
  print(responses);
}

DateTime convertStringToDateTime(String s) {
  int n = s.length - 16;
  String day = s[5] + s[6];
  String month = s[8] + s[9] + s[10];
  String year = s[n - 3] + s[n - 2] + s[n - 1] + s[n];
  n = s.length - 14;
  String time = s[n] +
      s[n + 1] +
      s[n + 2] +
      s[n + 3] +
      s[n + 4] +
      s[n + 5] +
      s[n + 6] +
      s[n + 7] +
      '.0000';
  HashMap monthList = new HashMap<String, String>();
  monthList["Jan"] = "01";
  monthList["Feb"] = "02";
  monthList["Mar"] = "03";
  monthList["Apr"] = "04";
  monthList["May"] = "05";
  monthList["Jun"] = "06";
  monthList["Jul"] = "07";
  monthList["Aug"] = "08";
  monthList["Sep"] = "09";
  monthList["Oct"] = "10";
  monthList["Nov"] = "11";
  monthList["Dec"] = "12";
  String dateTime = year + '-' + monthList[month] + '-' + day + ' ' + time;
  DateTime d = DateTime.tryParse(dateTime);
  return d;
}

class ResponseOfStudent {
  String name, roll, uid, link, sha;
  bool checkSHA;
  DateTime submitTime;
}
