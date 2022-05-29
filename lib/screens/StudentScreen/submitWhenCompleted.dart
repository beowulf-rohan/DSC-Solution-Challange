import 'package:demo/screens/StudentScreen/submitPDF.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class submitWhenCompleted extends StatefulWidget {
  String classId = "", assignmentName = "";
  submitWhenCompleted(this.classId, this.assignmentName);
  @override
  State<submitWhenCompleted> createState() => _submitWhenCompletedState();
}

class _submitWhenCompletedState extends State<submitWhenCompleted> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                        padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => submitPDF(
                                      widget.classId, widget.assignmentName),
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
            ],
          ),
        ),
      ),
    );
    ;
  }
}
