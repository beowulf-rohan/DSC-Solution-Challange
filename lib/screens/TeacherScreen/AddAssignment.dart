import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/screens/TeacherScreen/TeacherReusable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import '../../constants.dart';
class AddAAssignment extends StatefulWidget {
  static const String id = "AddAAssignment";
  String classname="";
  @override
  State<AddAAssignment> createState() => _AddAAssignmentState();
  AddAAssignment(this.classname);
}

class _AddAAssignmentState extends State<AddAAssignment> {
  String _name = "",
      _startDate = "",
      _endDate = "",
      _startTime = "",
      _endTime = "",
      _passwordVal = "",
      _drivelink = "";
  bool _passwordVisible = false;
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 75.0,
                  width: 75.0,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(height: 30.0),
                Text(
                  "Add a Assignment",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(height: 40.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
                  child: Container(
                    child: TextField(
                      onChanged: (value) {
                        _name = value;
                      },
                      cursorColor: kPrimaryColor,
                      style: TextStyle(color: Colors.grey.shade600),
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                        ),
                        hintText: "Enter your Name",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 0),
                  child: GestureDetector(
                    onTap: () async {
                      List<DateTime> dateTimeList =
                          await showOmniDateTimeRangePicker(
                        context: context,
                        primaryColor: Colors.grey[700],
                        backgroundColor: Colors.white,
                        calendarTextColor: Colors.black,
                        tabTextColor: Colors.black,
                        unselectedTabBackgroundColor: kPrimaryColor,
                        buttonTextColor: kPrimaryColor,
                        timeSpinnerTextStyle:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        timeSpinnerHighlightedTextStyle:
                            const TextStyle(color: Colors.black, fontSize: 24),
                        is24HourMode: false,
                        isShowSeconds: false,
                        startInitialDate: DateTime.now(),
                        startFirstDate:
                            DateTime(1600).subtract(const Duration(days: 3652)),
                        startLastDate: DateTime.now().add(
                          const Duration(days: 3652),
                        ),
                        endInitialDate: DateTime.now(),
                        endFirstDate:
                            DateTime(1600).subtract(const Duration(days: 3652)),
                        endLastDate: DateTime.now().add(
                          const Duration(days: 3652),
                        ),
                        borderRadius: const Radius.circular(16),
                      );
                      print(dateTimeList);
                      setState(() {
                        _startDate =
                            DateFormat('dd-MM-yyyy').format(dateTimeList[0]);
                        _endDate =
                            DateFormat('dd-MM-yyyy').format(dateTimeList[1]);
                        _startTime =
                            DateFormat('hh:mm').format(dateTimeList[0]);
                        _endTime = DateFormat('hh:mm').format(dateTimeList[1]);
                      });
                    },
                    child: Material(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: SizedBox(
                              height: 35,
                              width: 170,
                              child: Center(
                                child: Text(
                                  "Select date and time",
                                  style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
                      child: Container(
                        child: UserField(
                          heading: 'Start Date',
                          subtitle: _startDate,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
                      child: Container(
                        child: UserField(
                          heading: 'Start Time',
                          subtitle: _startTime,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
                      child: Container(
                        child: UserField(
                          heading: 'End Date',
                          subtitle: _endDate,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
                      child: Container(
                        child: UserField(
                          heading: 'End Time',
                          subtitle: _endTime,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0),
                  child: Container(
                    child: TextField(
                      onChanged: (value) {
                        _passwordVal = value;
                      },
                      cursorColor: kPrimaryColor,
                      obscureText: !_passwordVisible,
                      style: TextStyle(color: Colors.grey.shade600),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                        ),
                        hintText: "Enter your Password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          child: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0, 0),
                  child: GestureDetector(
                    onTap: () async {
                      FilePickerResult result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );
                      PlatformFile file = result.files.first;
                      final File fileForFirebase = File(file.path);
                      final PdfDocument document = PdfDocument(
                          inputBytes: fileForFirebase.readAsBytesSync());

                      //Add security to the document
                      final PdfSecurity security = document.security;
                      //Set password.
                      security.userPassword = _passwordVal;
                      security.ownerPassword = _passwordVal;
                      //Set the encryption algorithm
                      security.algorithm = PdfEncryptionAlgorithm.aesx256Bit;
                      //Save the document.
                      fileForFirebase.writeAsBytes(document.save());
                      //Dispose the document
                      document.dispose();
                      
                    },
                    child: Material(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: SizedBox(
                              height: 35,
                              width: 170,
                              child: Center(
                                child: Text(
                                  "Upload Assignment",
                                  style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
                  child: Container(
                    child: UserField(
                      heading: 'Drive Link',
                      subtitle: _drivelink,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 0),
                  child: GestureDetector(
                    onTap: () {
                      _firestore.collection("Classes")
                          .doc(FirebaseAuth.instance.currentUser.uid+widget.classname)
                          .collection("Assignment_List")
                          .add({
                        "Name": _name,
                        "Start Date": _startDate,
                        "End Date": _endDate,
                        "Start Time": _startTime,
                        "End Time": _endTime,
                        "Password": _passwordVal,
                        "Drive Link": _drivelink,
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: buttonHeight,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Create",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
