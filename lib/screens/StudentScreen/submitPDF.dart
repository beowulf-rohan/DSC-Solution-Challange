import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../constants.dart';

final _firestore = FirebaseFirestore.instance;
FilePickerResult result;
String classId = "", assignmentId = "";

class submitPDF extends StatefulWidget {
  static String id = "submitPDF";

  submitPDF(String cId, String aId) {
    classId = cId;
    assignmentId = aId;
  }

  @override
  State<submitPDF> createState() => _submitPDFState();
}

class _submitPDFState extends State<submitPDF> {
  bool showSpinner=false;
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
                      child: Image.asset('assets/file.png'),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      "Submit PDF",
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
                              result = await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf'],
                              );
                              setState(() {
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
                                          "Upload File",
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 0),
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            showSpinner=true;
                          });
                          DocumentSnapshot document = await _firestore
                              .collection('AUTH_DATA')
                              .doc('STUDENT')
                              .collection(FirebaseAuth.instance.currentUser.uid)
                              .doc('Student_Details')
                              .get();
                          PlatformFile file = result.files.first;
                          final File fileForFirebase = File(file.path);
                          List<int> imageBytes = fileForFirebase.readAsBytesSync();
                          //print(imageBytes);
                          String base64Image = base64Encode(imageBytes);
                          //print(base64Image);
                          var bytes = utf8.encode(base64Image); // data being hashed
                          var digest = sha256.convert(bytes);
                          String sha=digest.toString();
                          String downloadURL;
                          firebase_storage.UploadTask task =
                              await uploadFile(fileForFirebase, classId).whenComplete(() => null);
                          downloadURL = await firebase_storage
                              .FirebaseStorage.instance
                              .ref('Responses/' +
                              classId +
                              '/' +
                              assignmentId +
                              '/' +
                              FirebaseAuth
                                  .instance.currentUser.uid +
                              '.pdf')
                              .getDownloadURL();
                          print(downloadURL);
                          String name = document["Name"];
                          // String roll = document["Roll No"];
                          _firestore
                              .collection("Classes")
                              .doc(classId)
                              .collection("Assignment_List")
                              .doc(assignmentId)
                              .collection('Submissions')
                              .doc(FirebaseAuth.instance.currentUser.uid)
                              .set({
                            "Name": name,
                            "SHA": sha,
                            // "Roll": roll,
                            "Download Link": downloadURL,
                          });
                          setState(() {
                            showSpinner=false;
                          });
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
                              "Submit",
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

Future<firebase_storage.UploadTask> uploadFile(
    File file, String classname) async {
  if (file == null) {
    return null;
  }
  firebase_storage.UploadTask uploadTask;
  // Create a Reference to the file
  firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
      .ref('Responses/' +
          classId +
          '/' +
          assignmentId +
          '/' +
          FirebaseAuth.instance.currentUser.uid +
          '.pdf');

  final metadata = firebase_storage.SettableMetadata(
      contentType: 'file/pdf', customMetadata: {'picked-file-path': file.path});
  print("Uploading..!");

  uploadTask = ref.putData(await file.readAsBytes(), metadata);

  print("done..!");
  return Future.value(uploadTask);
}
