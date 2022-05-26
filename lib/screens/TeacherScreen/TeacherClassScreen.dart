import 'dart:collection';

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
  String classId="";
  @override
  State<TeacherClassScreen> createState() => _TeacherClassScreenState();
  TeacherClassScreen(this.classname,this.classId);
}

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
            press: () async{
              await getResponseList(widget.classId,completedAssignment[i].assignmentName).whenComplete(() => null);
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddAAssignment(classname,classId),
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
Future<void> getResponseList(String classId,String AssignmentName) async {
  TwilioFlutter twilioFlutter;
  twilioFlutter = TwilioFlutter(
      accountSid:
      'AC79b4aafe764eb646bac829cd4097d4bf', // replace *** with Account SID
      authToken:
      '26bffad6f171a3ad864413801c799d12', // replace xxx with Auth Token
      twilioNumber:
      '+16083363649' // replace .... with Twilio Number
  );
  SentSmsData data= await twilioFlutter.getSmsList();
  print(data.messages);
  List <Message> messages=[];
  for(int j=0;j<data.messages.length;j++){
    if(data.messages[j].direction=="inbound"){
      messages.add(data.messages[j]);
    }
  }
  List <HashMap <String,String> > finalList=[];
  for(int j=0;j<messages.length;j++){
    String sha=messages[j].body.substring(0,32);
    String uuid=messages[j].body.substring(32,36);
  }
}
