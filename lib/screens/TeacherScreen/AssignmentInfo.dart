import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

import '../../constants.dart';
import 'DownloadingDialog.dart';
import 'TeacherReusable.dart';

class AssignmentInfo extends StatefulWidget {
  AssignmentInfo(this.name, this.date, this.time, this.duration, this.link,
      this.studentContact, this.password);
  final String name, date, time, duration, link, password;
  final List<String> studentContact;
  static String id = "AssignmentInfo";

  @override
  State<AssignmentInfo> createState() => _AssignmentInfoState();
}

class _AssignmentInfoState extends State<AssignmentInfo> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: AssignemntCard(
                name: widget.name,
                date: widget.date,
                time: widget.time,
                duration: widget.duration,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Image.asset(
                        "assets/key.png",
                        height: 150,
                        width: 150,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                            child: GestureDetector(
                              onTap: () {
                                TwilioFlutter twilioFlutter;
                                twilioFlutter = TwilioFlutter(
                                    accountSid:
                                        'AC79b4aafe764eb646bac829cd4097d4bf', // replace *** with Account SID
                                    authToken:
                                        '26bffad6f171a3ad864413801c799d12', // replace xxx with Auth Token
                                    twilioNumber:
                                        '+16083363649' // replace .... with Twilio Number
                                    );
                                for (int i = 0;
                                    i < widget.studentContact.length;
                                    i++) {
                                  String number = widget.studentContact[i];
                                  String password = widget.password;
                                  String name = widget.name;
                                  twilioFlutter.sendSMS(
                                      toNumber: "+91" + number,
                                      messageBody:
                                          'Password for $name is : $password');
                                }
                                //Use sendSMS with the recipient number and message body.
                              },
                              child: Container(
                                height: buttonHeight,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF2a617a),
                                      blurRadius: 10.0,
                                      spreadRadius: 0.0,
                                      // shadow direction: bottom right
                                    )
                                  ],
                                  border: Border.all(color: Color(0xFF2a617a)),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [kPrimaryColor, Color(0xFF64abc9)],
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    "Send Password",
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
                      )
                    ],
                  ),
                  SizedBox(height: 60),
                  Column(
                    children: [
                      Image.asset(
                        "assets/folder.png",
                        height: 150,
                        width: 150,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                            child: GestureDetector(
                              onTap: () async {
                                showDialog(
                                  context: context,
                                  builder: (context) => DownloadingDialog(
                                      widget.link, widget.name),
                                );
                              },
                              child: Container(
                                height: buttonHeight,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF2a617a),
                                      blurRadius: 10.0,
                                      spreadRadius: 0.0,
                                      // shadow direction: bottom right
                                    )
                                  ],
                                  border: Border.all(color: Color(0xFF2a617a)),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [kPrimaryColor, Color(0xFF64abc9)],
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    "Download PDF",
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
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // @override
  // void initState() {
  //   Initiliaze();
  // }
}

// Future<void> Initiliaze() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await FlutterDownloader.initialize(
//       debug: true // optional: set false to disable printing logs to console
//       );
// }
