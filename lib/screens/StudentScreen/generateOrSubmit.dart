import 'package:demo/screens/StudentScreen/StudentReusable.dart';
import 'package:demo/screens/StudentScreen/createSHA.dart';
import 'package:demo/screens/StudentScreen/submitPDF.dart';
import 'package:demo/screens/TeacherScreen/DownloadingDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class generateOrSubmit extends StatelessWidget {
  static String id = "generateOrSubmit";
  String classId = "", assignmentLink = "", assignmentName = "";
  generateOrSubmit(this.classId, this.assignmentName, this.assignmentLink);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [kPrimaryColor, Colors.white],
            ),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
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
                                    assignmentLink, assignmentName),
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
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Image.asset(
                      "assets/data-encryption.png",
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        createSHA(classId, assignmentName),
                                  ));
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
                                  "Create SHA",
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
                SizedBox(height: 100),
                Column(
                  children: [
                    Image.asset(
                      "assets/file.png",
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        submitPDF(classId, assignmentName),
                                  ));
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
                                  "Submit PDF",
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
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
