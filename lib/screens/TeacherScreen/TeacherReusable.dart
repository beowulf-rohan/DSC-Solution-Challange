import 'dart:async';

import 'package:demo/constants.dart';
import 'package:demo/screens/TeacherScreen/TeacherClassScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'TeacherHome.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({Key key, @required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 30),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Fredoka',
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

Future<void> _copyToClipboard(BuildContext context, String classID) async {
  await Clipboard.setData(ClipboardData(text: classID));
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text('Class Code Copied'),
  ));
}

class ClassCard extends StatefulWidget {
  ClassCard(
      {Key key,
      @required this.path,
      @required this.className,
      @required this.department,
      @required this.batch,
      @required this.context})
      : super(key: key);
  final String path, className, department, batch;
  final BuildContext context;
  @override
  State<ClassCard> createState() => _ClassCardState();
}

class _ClassCardState extends State<ClassCard> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: InkWell(
          onTap: () async {
            setState(() {
              showSpinner = true;
            });
            await getAssignmentData(widget.path, widget.className)
                .then((value) => {null});
            setState(() {
              showSpinner = false;
            });
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TeacherClassScreen(widget.className),
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.20),
              border: Border.all(width: 2, color: Colors.white24),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 3, bottom: 3),
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset('images/google.png'),
                  ),
                ),
                VerticalDivider(
                  indent: 10,
                  endIndent: 10,
                  color: Colors.white.withOpacity(0.9),
                  thickness: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      SingleChildScrollView(
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.48,
                              child: Text(
                                widget.className,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontFamily: 'Fredoka',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                _copyToClipboard(context, widget.path);
                              },
                              icon: new IconTheme(
                                data: new IconThemeData(
                                    color: Colors.white.withOpacity(0.9)),
                                child: new Icon(Icons.copy),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.00),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Department : ',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Fredoka',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Text(
                                widget.department,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Fredoka',
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white.withOpacity(0.6)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Batch : ',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Fredoka',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Text(
                                widget.batch,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Fredoka',
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white.withOpacity(0.6)),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 7.5),
                      SizedBox(height: 10),
                    ],
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

class AssignemntCard extends StatelessWidget {
  const AssignemntCard({
    Key key,
    @required this.name,
    @required this.date,
    @required this.time,
    @required this.duration,
    @required this.press,
  }) : super(key: key);
  final String name, date, time, duration;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: InkWell(
        onTap: press,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.20),
            border: Border.all(width: 2, color: Colors.white24),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 3, bottom: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.52,
                        child: Text(
                          name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontFamily: 'Fredoka',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.00),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Date : ',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Fredoka',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              date,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Fredoka',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white.withOpacity(0.6)),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Time : ',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Fredoka',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              time,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Fredoka',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white.withOpacity(0.6)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.5,
                        ),
                        Row(
                          children: [
                            Text(
                              'Duration : ',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Fredoka',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              duration,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Fredoka',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white.withOpacity(0.6)),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 7.5),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserField extends StatelessWidget {
  final String heading, subtitle;
  UserField({@required this.heading, @required this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 20, 0.0, 0.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              heading,
              style: TextStyle(
                  fontSize: 15.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Text(
                subtitle,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Divider(color: Colors.grey.shade900),
          ],
        ),
      ),
    );
  }
}

class ResponseCard extends StatefulWidget {
  @override
  State<ResponseCard> createState() => _ResponseCardState();
}

class _ResponseCardState extends State<ResponseCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.20),
          border: Border.all(width: 2, color: Colors.white24),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.70,
                          child: Text(
                            "Roll Number",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontFamily: 'Fredoka',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: new IconTheme(
                            data: new IconThemeData(color: Colors.lightGreen),
                            child: new Icon(Icons.verified_user_rounded),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.70,
                          child: Text(
                            "Student Name",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Fredoka',
                                fontWeight: FontWeight.normal,
                                color: Colors.white.withOpacity(0.6)),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: new IconTheme(
                            data: new IconThemeData(
                                color: Colors.white.withOpacity(0.9)),
                            child: new Icon(Icons.download),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
