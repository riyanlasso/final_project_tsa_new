import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tsa_new/ProfilePage.dart';
import 'package:final_project_tsa_new/belajarFuturebuilder.dart';
import 'package:final_project_tsa_new/belajarStreamBuilder.dart';
import 'package:final_project_tsa_new/chat/chatToART/chatPageToART.dart';
import 'package:final_project_tsa_new/chat/chatToCustomers/chatToCustomers.dart';
import 'package:final_project_tsa_new/chat/chatpage.dart';
import 'package:final_project_tsa_new/cleanhomeART2.dart';
import 'package:final_project_tsa_new/editProfileART.dart';
import 'package:final_project_tsa_new/login.dart';
import 'package:final_project_tsa_new/profileARTrole.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'chat/chatToCustomers/chatPageToCustomers.dart';

class pilihMenuART extends StatefulWidget {
  const pilihMenuART({Key? key}) : super(key: key);
  _pilihMenuART createState() => _pilihMenuART();
}

class _pilihMenuART extends State<pilihMenuART> {
  final user = FirebaseAuth.instance.currentUser!;

  CollectionReference database = FirebaseFirestore.instance.collection('ART');
  Widget build(BuildContext context) {
    final uid = user.uid;
    final email = user.email as String;
    final user1 = FirebaseAuth.instance.currentUser!;
    String imageUrl = '';
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: database.doc(uid).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Column(
                    children: [
                      //add
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          user.email!,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          user.uid,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => cleanhomeART2()));
                          },
                          child: Text('HOME'),
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.green,
                              shape: StadiumBorder(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 145, vertical: 15)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        belajarStreamBuilder()));
                          },
                          child: Text('PROFILE'),
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.green,
                              shape: StadiumBorder(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 140, vertical: 15)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => chatpageToCustomers(
                                          email: email,
                                        )));
                          },
                          child: Text('CHAT CUSTOMERS'),
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.green,
                              shape: StadiumBorder(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 110, vertical: 15)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => chatpage(
                                          email: email,
                                        )));
                          },
                          child: Text('GROUP CHAT ART'),
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.green,
                              shape: StadiumBorder(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 110, vertical: 15)),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            logout(context);
                          },
                          child: Text('LOGOUT'),
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.green,
                              shape: StadiumBorder(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 140, vertical: 15)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => login(),
        ),
        (route) => false);
  }
}
