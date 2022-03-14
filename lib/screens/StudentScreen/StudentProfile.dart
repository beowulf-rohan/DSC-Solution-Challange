import 'package:flutter/material.dart';
import 'package:demo/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class StudentProfile extends StatefulWidget {
  static const String id = 'StudentProfile';
  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  String _name, _address, _aadhar, _panId, _contact;
  bool _passwordVisible1 = false,
      _passwordVisible2 = false,
      showSpinner = false;
  //final _firestore = FirebaseFirestore.instance;

  // Future getDetails() async {
  //   final SharedPreferences sharedPref = await SharedPreferences.getInstance();
  //   setState(() {
  //     _name = sharedPref.getString(USER_NAME);
  //     _contact = sharedPref.getString(USER_CONTACT);
  //     _address = sharedPref.getString(USER_ADDRESS);
  //     _aadhar = sharedPref.getString(USER_AADHAR);
  //     _panId = sharedPref.getString(USER_PANID);
  //   });
  // }
  //
  // Future<String> uploadImageToStorage(File _image) async {
  //   setState(() {
  //     showSpinner = true;
  //   });
  //   try {
  //     Reference reference = FirebaseStorage.instance
  //         .ref()
  //         .child('${DateTime.now().millisecondsSinceEpoch}');
  //     UploadTask uploadTask = reference.putFile(_image);
  //     TaskSnapshot downloadUrl = (await uploadTask.whenComplete(() {}));
  //     String url = (await downloadUrl.ref.getDownloadURL());
  //     setState(() {
  //       showSpinner = false;
  //     });
  //     return url;
  //   } catch (e) {
  //     setState(() {
  //       showSpinner = false;
  //     });
  //     return null;
  //   }
  // }

  // Future<File> pickImage({@required ImageSource source}) async {
  //   PickedFile file = await ImagePicker().getImage(
  //     source: source,
  //     imageQuality: 50,
  //   );
  //   File selectedImage = File(file.path);
  //   return selectedImage;
  // }
  //
  // uploadImage() async {
  //   File selectedImage = await pickImage(source: ImageSource.gallery);
  //   String url = await uploadImageToStorage(selectedImage);
  //   if (url != null) {
  //     _firestore
  //         .collection(USER_COLLECTION)
  //         .doc(FirebaseAuth.instance.currentUser.uid)
  //         .update({USER_DP_LINK: url});
  //     final SharedPreferences sharedPref = await SharedPreferences.getInstance();
  //     sharedPref.setString(USER_DP_LINK, url);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // getDetails().whenComplete(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(height: 70),
                Center(
                  child: Container(
                    height: 75.0,
                    width: 75.0,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                SizedBox(height: 30.0),
                Center(
                  child: Text(
                    "Update User Details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSans',
                      fontSize: 30.0,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
                  child: Container(
                    child: TextField(
                      onChanged: (value) {
                        _name = value;
                      },
                      controller: TextEditingController(text: _name),
                      cursorColor: kPrimaryColor,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontFamily: 'NotoSans',
                      ),
                      decoration: InputDecoration(
                        labelText: "NAME",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                          fontFamily: 'NotoSans',
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                        ),
                        hintText: "Enter your Name",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
                  child: Container(
                    child: TextField(
                      onChanged: (value) {
                        _address = value;
                      },
                      controller: TextEditingController(text: _address),
                      cursorColor: kPrimaryColor,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontFamily: 'NotoSans',
                      ),
                      decoration: InputDecoration(
                        labelText: "Contact Number",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                          fontFamily: 'NotoSans',
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                        ),
                        hintText: "Enter your Contact Number",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
                  child: Container(
                    child: TextField(
                      onChanged: (value) {
                        _contact = value;
                      },
                      keyboardType: TextInputType.number,
                      controller: TextEditingController(text: _contact),
                      cursorColor: kPrimaryColor,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontFamily: 'NotoSans',
                      ),
                      decoration: InputDecoration(
                        labelText: "CONTACT NUMBER",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                          fontFamily: 'NotoSans',
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                        ),
                        hintText: "Enter your Contact Number",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
                  child: Container(
                    child: TextField(
                      onChanged: (value) {
                        _aadhar = value;
                      },
                      keyboardType: TextInputType.number,
                      controller: TextEditingController(text: _aadhar),
                      cursorColor: kPrimaryColor,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontFamily: 'NotoSans',
                      ),
                      decoration: InputDecoration(
                        labelText: "AADHAR NO.",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                          fontFamily: 'NotoSans',
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                        ),
                        hintText: "Enter your AADHAR Number",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
                  child: Container(
                    child: TextField(
                      onChanged: (value) {
                        _panId = value;
                      },
                      controller: TextEditingController(text: _panId),
                      cursorColor: kPrimaryColor,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontFamily: 'NotoSans',
                      ),
                      decoration: InputDecoration(
                        labelText: "PAN ID",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                          fontFamily: 'NotoSans',
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                        ),
                        hintText: "Enter your PAN ID",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 30.0, 0, 0),
                  child: GestureDetector(
                    onTap: () {
                      // uploadImage();
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
                                  "Upload Display Picture",
                                  style: TextStyle(
                                    fontFamily: 'NotoSans',
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 0),
                  child: GestureDetector(
                    onTap: () async {
                      // final SharedPreferences sharedPref = await SharedPreferences.getInstance();
                      setState(() {
                        // if (_name != null &&
                        //     _address != null &&
                        //     _contact != null &&
                        //     _aadhar != null &&
                        //     _panId != null &&
                        //     _contact.length == 10 &&
                        //     _aadhar.length == 12 &&
                        //     _panId.length == 10) {
                        //   sharedPref.setString(USER_NAME, _name);
                        //   sharedPref.setString(USER_ADDRESS, _address);
                        //   sharedPref.setString(USER_CONTACT, _contact);
                        //   sharedPref.setString(USER_PANID, _panId);
                        //   sharedPref.setString(USER_AADHAR, _aadhar);
                        //   _firestore
                        //       .collection(USER_COLLECTION)
                        //       .doc(FirebaseAuth.instance.currentUser.uid)
                        //       .update({
                        //     USER_NAME: _name,
                        //     USER_ADDRESS: _address,
                        //     USER_CONTACT: _contact,
                        //     USER_PANID: _panId,
                        //     USER_AADHAR: _aadhar,
                        //   });
                        //   Navigator.pop(context);
                        // } else {
                        //   if (_contact.length != 10) {
                        //     Alert(
                        //         context: context,
                        //         title: "Your phone number should be 10 digits long",
                        //         buttons: [
                        //           DialogButton(
                        //             child: Text(
                        //               "CANCEL",
                        //               style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontSize: 20.0,
                        //               ),
                        //             ),
                        //             onPressed: () => Navigator.pop(context),
                        //             color: primaryColour,
                        //             width: 150.0,
                        //             radius: BorderRadius.circular(15.0),
                        //           ),
                        //         ],
                        //         desc: "Please Re-enter")
                        //         .show();
                        //   }
                        //   else if (_aadhar.length != 12) {
                        //     Alert(
                        //         context: context,
                        //         title: "Your Aadhar Number should be 12 digits long",
                        //         buttons: [
                        //           DialogButton(
                        //             child: Text(
                        //               "CANCEL",
                        //               style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontSize: 20.0,
                        //               ),
                        //             ),
                        //             onPressed: () => Navigator.pop(context),
                        //             color: primaryColour,
                        //             width: 150.0,
                        //             radius: BorderRadius.circular(15.0),
                        //           ),
                        //         ],
                        //         desc: "Please Re-enter")
                        //         .show();
                        //   }
                        //   else if (_panId.length != 10) {
                        //     Alert(
                        //         context: context,
                        //         title: "Your Pan Id should be 10 digits long",
                        //         buttons: [
                        //           DialogButton(
                        //             child: Text(
                        //               "CANCEL",
                        //               style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontSize: 20.0,
                        //               ),
                        //             ),
                        //             onPressed: () => Navigator.pop(context),
                        //             color: primaryColour,
                        //             width: 150.0,
                        //             radius: BorderRadius.circular(15.0),
                        //           ),
                        //         ],
                        //         desc: "Please Re-enter")
                        //         .show();
                        //   }
                        // }
                      });
                    },
                    child: Container(
                      height: buttonHeight,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Update Details",
                          style: TextStyle(
                            fontFamily: 'NotoSans',
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
    );
  }
}
