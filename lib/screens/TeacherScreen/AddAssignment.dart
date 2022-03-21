import 'package:demo/screens/TeacherScreen/TeacherReusable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import '../../constants.dart';

class AddAAssignment extends StatefulWidget {
  static const String id = "AddAAssignment";

  @override
  State<AddAAssignment> createState() => _AddAAssignmentState();
}

class _AddAAssignmentState extends State<AddAAssignment> {
  String _name = "",
      _startDate = "",
      _endDate = "",
      _startTime = "",
      _endTime = "",
      _password = "";

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
                  padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0, 0),
                  child: GestureDetector(
                    onTap: () async {
                      FilePickerResult result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['jpg', 'pdf', 'doc'],
                      );
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
                    child: TextField(
                      onChanged: (value) {
                        _password = value;
                      },
                      keyboardType: TextInputType.number,
                      cursorColor: kPrimaryColor,
                      style: TextStyle(color: Colors.grey.shade600),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                        ),
                        hintText: "Enter the Password",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    //   onTap: () async {
                    //     if (_name != null &&
                    //         _address != null &&
                    //         _contactNum != null &&
                    //         _aadhar != null &&
                    //         _panId != null &&
                    //         _contactNum.length == 10 &&
                    //         _aadhar.length == 12 &&
                    //         _panId.length == 10) {
                    //       final SharedPreferences sharedPref =
                    //           await SharedPreferences.getInstance();
                    //       sharedPref.setString(USER_NAME, _name);
                    //       sharedPref.setString(USER_ADDRESS, _address);
                    //       sharedPref.setString(USER_CONTACT, _contactNum);
                    //       sharedPref.setString(USER_PANID, _panId);
                    //       sharedPref.setString(USER_AADHAR, _aadhar);
                    //       sharedPref.setString(USER_PROPERTY_COUNT, "0");
                    //       sharedPref.setString(USER_DP_LINK, _photoUrl);
                    //       _firestore
                    //           .collection(USER_COLLECTION)
                    //           .doc(FirebaseAuth.instance.currentUser.uid)
                    //           .set({
                    //         USER_EMAIL: loggedInUser.email,
                    //         USER_NAME: _name,
                    //         USER_ADDRESS: _address,
                    //         USER_CONTACT: _contactNum,
                    //         USER_PANID: _panId,
                    //         USER_AADHAR: _aadhar,
                    //         USER_PROPERTY_COUNT: "0",
                    //         USER_DP_LINK: _photoUrl,
                    //       });
                    //       Navigator.of(context).pushNamedAndRemoveUntil(
                    //           NavigationScreen.id,
                    //           (Route<dynamic> route) => false);
                    //     } else {
                    //       if (_contactNum.length != 10) {
                    //         Alert(
                    //                 context: context,
                    //                 title:
                    //                     "Your phone number should be 10 digits long",
                    //                 buttons: [
                    //                   DialogButton(
                    //                     child: Text(
                    //                       "CANCEL",
                    //                       style: TextStyle(
                    //                         color: Colors.white,
                    //                         fontSize: 20.0,
                    //                       ),
                    //                     ),
                    //                     onPressed: () => Navigator.pop(context),
                    //                     color: primaryColour,
                    //                     width: 150.0,
                    //                     radius: BorderRadius.circular(15.0),
                    //                   ),
                    //                 ],
                    //                 desc: "Please Re-enter")
                    //             .show();
                    //       } else if (_aadhar.length != 12) {
                    //         Alert(
                    //                 context: context,
                    //                 title:
                    //                     "Your Aadhar Number should be 12 digits long",
                    //                 buttons: [
                    //                   DialogButton(
                    //                     child: Text(
                    //                       "CANCEL",
                    //                       style: TextStyle(
                    //                         color: Colors.white,
                    //                         fontSize: 20.0,
                    //                       ),
                    //                     ),
                    //                     onPressed: () => Navigator.pop(context),
                    //                     color: primaryColour,
                    //                     width: 150.0,
                    //                     radius: BorderRadius.circular(15.0),
                    //                   ),
                    //                 ],
                    //                 desc: "Please Re-enter")
                    //             .show();
                    //       } else if (_panId.length != 10) {
                    //         Alert(
                    //                 context: context,
                    //                 title: "Your Pan Id should be 10 digits long",
                    //                 buttons: [
                    //                   DialogButton(
                    //                     child: Text(
                    //                       "CANCEL",
                    //                       style: TextStyle(
                    //                         color: Colors.white,
                    //                         fontSize: 20.0,
                    //                       ),
                    //                     ),
                    //                     onPressed: () => Navigator.pop(context),
                    //                     color: primaryColour,
                    //                     width: 150.0,
                    //                     radius: BorderRadius.circular(15.0),
                    //                   ),
                    //                 ],
                    //                 desc: "Please Re-enter")
                    //             .show();
                    //       }
                    //     }
                    //   },
                    child: Container(
                      height: buttonHeight,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Sign Up",
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
