import 'package:demo/constants.dart';
import 'package:demo/screens/TeacherScreen/TeacherClassScreen.dart';
import 'package:flutter/material.dart';

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

class ClassCard extends StatelessWidget {
  const ClassCard(
      {Key key,
      @required this.path,
      @required this.className,
      @required this.department,
      @required this.batch})
      : super(key: key);
  final String path, className, department, batch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, TeacherClassScreen.id);
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
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.52,
                        child: Text(
                          className,
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
                              'Department : ',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Fredoka',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              department,
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
                              batch,
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

class AssignemntCard extends StatelessWidget {
  const AssignemntCard({
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
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.20),
            border: Border.all(width: 2, color: Colors.white24),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
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
