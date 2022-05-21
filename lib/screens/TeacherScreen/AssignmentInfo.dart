import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import '../../constants.dart';
import 'TeacherReusable.dart';

class AssignmentInfo extends StatefulWidget {
  AssignmentInfo(this.name, this.date, this.time, this.duration, this.link);
  final String name, date, time, duration, link;
  static String id = "AssignmentInfo";

  @override
  State<AssignmentInfo> createState() => _AssignmentInfoState();
}

class _AssignmentInfoState extends State<AssignmentInfo> {
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
                                // Navigator.pushNamed(context, createSHA.id);
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
                                final taskId = await FlutterDownloader.enqueue(
                                  url: widget.link,
                                  savedDir: APP_NAME,
                                  showNotification:
                                      true, // show download progress in status bar (for Android)
                                  openFileFromNotification:
                                      true, // click on notification to open downloaded file (for Android)
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

  @override
  void initState() {
    Initiliaze();
  }
}

Future<void> Initiliaze() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
}
