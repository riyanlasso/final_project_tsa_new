import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tsa_new/editProfileART.dart';
import 'package:final_project_tsa_new/editProfileCustomers.dart';
import 'package:final_project_tsa_new/pilihMenuART.dart';
import 'package:final_project_tsa_new/pilihMenuCustomers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class profileCustomers extends StatefulWidget {
  const profileCustomers({Key? key}) : super(key: key);
  _profileCustomers createState() => _profileCustomers();
}

class _profileCustomers extends State<profileCustomers> {
  String imageUrl = '';
  String imageUrl2 = '';
  Future pickGalery() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      final uid = user.uid;
      ImagePicker imagePicker = ImagePicker();
      XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
      print('${file?.path}');
      if (file == null) {
        return;
      }
      String date = DateTime.now().millisecondsSinceEpoch.toString();
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child(uid);
      Reference referenceImageToUpload = referenceDirImages.child(date);
      try {
        await referenceImageToUpload.putFile(File(file.path));
        imageUrl = await referenceImageToUpload.getDownloadURL();
        DocumentReference docUser =
            FirebaseFirestore.instance.collection("users").doc(uid);
        docUser.update({
          'imageUrl': imageUrl,
        });
      } catch (e) {}
    } on PlatformException catch (e) {
      print('Failed Image : $e ');
    }

    Navigator.pop(context);
  }

  Future openCamera() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      final uid = user.uid;
      ImagePicker imagePicker = ImagePicker();
      XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
      print('${file?.path}');
      if (file == null) {
        return;
      }
      String date = DateTime.now().millisecondsSinceEpoch.toString();
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child(uid);
      Reference referenceImageToUpload = referenceDirImages.child(date);
      try {
        await referenceImageToUpload.putFile(File(file.path));
        imageUrl = await referenceImageToUpload.getDownloadURL();
        DocumentReference docUser =
            FirebaseFirestore.instance.collection("users").doc(uid);
        docUser.update({
          'imageUrl': imageUrl,
        });
      } catch (e) {}
    } on PlatformException catch (e) {
      print('Failed Image : $e ');
    }

    Navigator.pop(context);
  }

  CollectionReference dataCustomers =
      FirebaseFirestore.instance.collection('users');
  final Customers = FirebaseAuth.instance.currentUser!;
  @override
  void initState() {
    final uid = Customers.uid;
    dataCustomers.doc(uid).get().then((value) {
      var fields = value.data() as Map<String, dynamic>;
      setState(() {
        imageUrl = fields['imageUrl'];
        imageUrl2 = fields['imageUrl'];
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final uid = user.uid;

    CollectionReference database =
        FirebaseFirestore.instance.collection('users');

    return Scaffold(
      body: StreamBuilder<DocumentSnapshot<Object?>>(
        stream: database.doc(uid).snapshots(),
        builder: (context, snapshot) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10, top: 30),
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => Column(
                                      children: [
                                        ListTile(
                                          leading: Icon(Icons.camera_alt),
                                          title: Text('Camera'),
                                          onTap: () {
                                            // Navigator.of(context)
                                            //     .pop(ImageSource.camera);
                                            openCamera();
                                          },
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.image),
                                          title: Text('Galery'),
                                          onTap: () {
                                            pickGalery();
                                          },
                                        ),
                                      ],
                                    ));
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                // color: Color.fromARGB(255, 0, 0, 0),
                                // border: Border.all(
                                //     color: Color.fromARGB(255, 184, 157, 157),
                                //     width: 4),
                                shape: BoxShape.circle),
                            child:
                                // image != null
                                //     ? ClipOval(
                                //         child: Image.file(
                                //           image!,
                                //           width: 160,
                                //           height: 160,
                                //           fit: BoxFit.cover,
                                //         ),
                                //       )
                                //     : Image.asset('profileART.png')
                                Column(
                              children: [
                                // Image.asset('profileART.png'),
                                if (data['imageUrl'] == null)
                                  Image.asset('profileART.png')
                                else if (data['imageUrl'] != null)
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: ClipOval(
                                            child: Image.network(imageUrl2),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                // Image.asset('profileART.png')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Personal Information',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Email',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: user.email,
                                      ),
                                      enabled: false,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Alamat',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: '${data['Alamat']}',
                                      ),
                                      enabled: false,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Nomor Telepon',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: '${data['Phone Number']}',
                                      ),
                                      enabled: false,
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => editProfileCustomers(),
                            ));
                      },
                      child: Text('Update')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pilihMenuCustomers()));
                      },
                      child: Text('Kembali')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
