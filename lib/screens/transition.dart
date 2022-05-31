import 'dart:async';

import 'package:demo/screens/IntroScreen.dart';
import 'package:flutter/material.dart';
class transition extends StatefulWidget {
  @override
  State<transition> createState() => _transitionState();
}

class _transitionState extends State<transition> {
  bool showSpinner=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      showSpinner=true;
    });
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => IntroScreen(),
      ));
    });
    setState(() {
      showSpinner=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 250,
                    ),
                    SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.asset('images/google.png')),
                    SizedBox(height: 30.0),
                    Text(
                      'OFFLINE QUIZ',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Fredoka',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                // showSpinner
                //     ? Padding(
                //   padding: EdgeInsets.symmetric(vertical: 15),
                //   child: LinearProgressIndicator(
                //     backgroundColor: Colors.white,
                //     valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                //   ),
                // )
                //     : null,
              ],
            ),
          ),
      ),
    );
  }
}
