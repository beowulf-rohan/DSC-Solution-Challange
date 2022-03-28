import 'package:flutter/material.dart';

import '../../constants.dart';

class AssignmentInfo extends StatelessWidget {
  static String id = "AssignmentInfo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Head(
          name: 'ABC1',
          date: '13-03-2022',
          time: '3:21PM',
          duration: '1 hours',
          response: '30/60',
        ),
      ),
    );
  }
}

class Head extends StatelessWidget {
  const Head({
    Key key,
    @required this.name,
    @required this.date,
    @required this.time,
    @required this.duration,
    @required this.response,
  }) : super(key: key);
  final String name, date, time, duration, response;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: InkWell(
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
                            Text(
                              'Response : ',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Fredoka',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              response,
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
    );
  }
}
