//import 'dart:html';

//import 'dart:html';

import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:crypto/crypto.dart';
import 'dart:io';
import '../../constants.dart';
import '../TeacherScreen/TeacherReusable.dart';

class createSHA extends StatefulWidget {
  static String id = "createSHA";
  String classId = "", assignmentId = "";
  createSHA(this.classId, this.assignmentId);
  @override
  _createSHAState createState() => _createSHAState();
}

class _createSHAState extends State<createSHA> {
  bool showSpinner=false;
  String _shakey = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 75.0,
                      width: 75.0,
                      child: Image.asset('assets/data-encryption.png'),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      "Create SHA",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My work',
                          style: TextStyle(
                              fontSize: 15.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0, 0),
                          child: GestureDetector(
                            onTap: () async {
                              setState(() {
                                showSpinner=true;
                              });
                              FilePickerResult result =
                                  await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf'],
                              );
                              PlatformFile file = result.files.first;
                              final File fileForFirebase = File(file.path);
                              List<int> imageBytes =
                                  fileForFirebase.readAsBytesSync();
                              //print(imageBytes);
                              String base64Image = base64Encode(imageBytes);
                              //print(base64Image);
                              var bytes =
                                  utf8.encode(base64Image); // data being hashed
                              var digest = sha256.convert(bytes);
                              print(digest.toString());
                              setState(() {
                                _shakey = digest.toString();
                                showSpinner=false;
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
                                          "Create SHA",
                                          style: TextStyle(
                                            fontFamily: 'NotoSans',
                                            color: Colors.white,
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
                      ],
                    ),
                    UserField(
                      heading: 'SHA Key',
                      subtitle: _shakey,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 0),
                      child: GestureDetector(
                        onTap: () {
                          String message = _shakey +
                              '%' + FirebaseAuth.instance.currentUser.uid+
                              '%' +
                              widget.classId +
                              '%' +
                              widget.assignmentId;
                          List<String> recipents = ["+16083363649"];
                          _sendSMS(message, recipents);
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: buttonHeight,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              "Send SMS",
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
        ),
      ),
    );
  }
}

void _sendSMS(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}
