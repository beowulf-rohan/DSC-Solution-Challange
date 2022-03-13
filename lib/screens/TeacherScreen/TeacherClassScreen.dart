import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../constants.dart';
import 'TeacherReusable.dart';

class TeacherClassScreen extends StatefulWidget {
  static String id = "TeacherClassScreen";
  @override
  State<TeacherClassScreen> createState() => _TeacherClassScreenState();
}

class _TeacherClassScreenState extends State<TeacherClassScreen> {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Column(
          children: [
            HeadingText(text: "My Assignments"),
            AssignemntCard(
                name: 'ABC1',
                date: '13-03-2022',
                time: '3:21PM',
                duration: '1 hours',
                response: '30/60'),
            AssignemntCard(
                name: 'ABC2',
                date: '16-03-2022',
                time: '5:21AM',
                duration: '3 hours',
                response: '20/60'),
          ],
        ),
        // floatingActionButton: Padding(
        //   padding: EdgeInsets.only(bottom: 10, right: 15, top: 0, left: 0),
        //   child: FabCircularMenu(
        //     fabCloseColor: Colors.white.withOpacity(0.7),
        //     fabOpenColor: Colors.white.withOpacity(0.7),
        //     key: fabKey,
        //     alignment: Alignment.bottomRight,
        //     ringColor: Colors.white.withOpacity(0.7),
        //     ringDiameter: 300.0,
        //     ringWidth: 75.0,
        //     fabSize: 60.0,
        //     fabElevation: 8.0,
        //     fabIconBorder: CircleBorder(),
        //     fabColor: Colors.white,
        //     fabOpenIcon: Icon(Icons.menu, color: kPrimaryColor),
        //     fabCloseIcon: Icon(Icons.close, color: kPrimaryColor),
        //     fabMargin: const EdgeInsets.all(16.0),
        //     animationDuration: const Duration(milliseconds: 800),
        //     animationCurve: Curves.easeInOutCirc,
        //     onDisplayChange: (isOpen) {
        //       //_showSnackBar(context, "The menu is ${isOpen ? "open" : "closed"}");
        //     },
        //     children: <Widget>[
        //       RawMaterialButton(
        //         onPressed: () {
        //           // _showSnackBar(context, "You pressed 2");
        //         },
        //         shape: CircleBorder(),
        //         padding: const EdgeInsets.all(12.0),
        //         child: Icon(Icons.person_add, size: 30, color: kPrimaryColor),
        //       ),
        //       RawMaterialButton(
        //         onPressed: () {
        //           // Navigator.pushNamed(context, MakeNewClass.id);
        //         },
        //         shape: CircleBorder(),
        //         padding: const EdgeInsets.all(12.0),
        //         child:
        //             Icon(Icons.note_add_sharp, size: 30, color: kPrimaryColor),
        //       ),
        //     ],
        //   ),
        // ),
        floatingActionButton: _getFAB(),
      ),
    );
  }
}

Widget _getFAB() {
  return Padding(
    padding: EdgeInsets.only(bottom: 10, right: 15, top: 0, left: 0),
    child: SpeedDial(
      overlayColor: Colors.transparent,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22),
      backgroundColor: kPrimaryColor,
      visible: true,
      // curve: Curves.bounceIn,
      children: [
        // FAB 1
        SpeedDialChild(
          child: Icon(Icons.person_add, color: kPrimaryColor),
          onTap: () {/* do anything */},
          label: 'Add Student',
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.0),
          labelBackgroundColor: kPrimaryColor,
        ),
        // FAB 2
        SpeedDialChild(
            child: Icon(Icons.assignment, color: kPrimaryColor),
            onTap: () {},
            label: 'Add Assignment',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: kPrimaryColor),
      ],
    ),
  );
}
