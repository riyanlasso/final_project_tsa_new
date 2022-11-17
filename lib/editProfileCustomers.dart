import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tsa_new/belajarFuturebuilder.dart';
import 'package:final_project_tsa_new/belajarStreamBuilder.dart';
import 'package:final_project_tsa_new/pilihMenuART.dart';
import 'package:final_project_tsa_new/profilCustomers.dart';

import 'package:final_project_tsa_new/profileARTrole.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class editProfileCustomers extends StatefulWidget {
  const editProfileCustomers({Key? key}) : super(key: key);
  _editProfileCustomers createState() => _editProfileCustomers();
}

class _editProfileCustomers extends State<editProfileCustomers> {
  final TextEditingController emailController = new TextEditingController();
  // final TextEditingController passwordController = new TextEditingController();
  final TextEditingController alamatController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  final keyUpdate = GlobalKey<FormState>();
  final keyUpdate2 = GlobalKey<FormState>();
  final keyUpdate3 = GlobalKey<FormState>();
  final user = FirebaseAuth.instance.currentUser!;
  dynamic data;

  Future<dynamic> getData() async {
    final uid = user.uid;
    final DocumentReference document =
        FirebaseFirestore.instance.collection("ART").doc(uid);

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        data = snapshot.data;
      });
    });
  }

  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final uid = user.uid;
    CollectionReference database =
        FirebaseFirestore.instance.collection('users');
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Form(
            key: keyUpdate,
            child: Column(children: <Widget>[
              Container(
                // email
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'email',
                        ),
                        validator: (value1) {
                          if (value1 == null || value1.isEmpty) {
                            return 'Masukkan Email Baru Anda';
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if (keyUpdate.currentState!.validate()) {
                                editEmail();
                              }
                            },
                            child: Text('edit'))
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Form(
              key: keyUpdate2,
              child: Column(
                children: [
                  Container(
                    //alamat
                    child: Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            controller: alamatController,
                            decoration: InputDecoration(
                              labelText: 'alamat',
                            ),
                            validator: (value2) {
                              if (value2 == null || value2.isEmpty) {
                                return 'Masukkan Alamat Anda';
                              }
                              return null;
                            },
                          ),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  if (keyUpdate2.currentState!.validate()) {
                                    editAlamat();
                                  }
                                },
                                child: Text('edit')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Form(
              key: keyUpdate3,
              child: Column(
                children: [
                  Container(
                    //alamat
                    child: Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              labelText: 'Nomor Telepon',
                            ),
                            validator: (value3) {
                              if (value3 == null || value3.isEmpty) {
                                return 'Masukkan Nomor Telepon Anda';
                              }
                              return null;
                            },
                          ),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  if (keyUpdate3.currentState!.validate()) {
                                    editPhoneNumber();
                                  }
                                },
                                child: Text('edit')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return profileCustomers();
                }), (route) => false);
              },
              child: Text('Selesai')),
        ],
      )),
    );
  }

  void editEmail() {
    final uid = user.uid;
    dynamic data;
    DocumentReference docUser =
        FirebaseFirestore.instance.collection("users").doc(uid);

    user.updateEmail(emailController.text);
    docUser.update({
      'email': emailController.text,
    });
    print('Email Berhasil Update');
    emailController.clear();
  }

  void editAlamat() {
    final uid = user.uid;
    dynamic data;
    DocumentReference docUser =
        FirebaseFirestore.instance.collection("users").doc(uid);
    Future<dynamic> getData() async {
      final DocumentReference document =
          FirebaseFirestore.instance.collection("users").doc(uid);

      await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
        setState(() {
          data = snapshot.data;
        });
      });
    }

    docUser.update({
      'Alamat': alamatController.text,
    });
    print('Alamat Berhasil Update');
    alamatController.clear();
  }

  void editPhoneNumber() {
    final uid = user.uid;
    dynamic data;
    DocumentReference docUser =
        FirebaseFirestore.instance.collection("users").doc(uid);
    Future<dynamic> getData() async {
      final DocumentReference document =
          FirebaseFirestore.instance.collection("users").doc(uid);

      await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
        setState(() {
          data = snapshot.data;
        });
      });
    }

    docUser.update({
      'Phone Number': phoneController.text,
    });
    print('Nomor Telepon Berhasil Update');
    phoneController.clear();
  }
}
