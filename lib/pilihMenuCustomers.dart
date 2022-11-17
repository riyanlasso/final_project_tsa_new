import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tsa_new/ProfilePage.dart';
import 'package:final_project_tsa_new/belajarFuturebuilder.dart';
import 'package:final_project_tsa_new/belajarStreamBuilder.dart';
import 'package:final_project_tsa_new/chat/chatPageCustomers.dart';
import 'package:final_project_tsa_new/chat/chatToART/chatPageToART.dart';
import 'package:final_project_tsa_new/chat/chatpage.dart';
import 'package:final_project_tsa_new/cleanhomeART2.dart';
import 'package:final_project_tsa_new/cleanhomeCustomer.dart';
import 'package:final_project_tsa_new/editProfileART.dart';
import 'package:final_project_tsa_new/login.dart';
import 'package:final_project_tsa_new/profilCustomers.dart';
import 'package:final_project_tsa_new/profileARTrole.dart';
import 'package:final_project_tsa_new/saldoMyservant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class pilihMenuCustomers extends StatefulWidget {
  const pilihMenuCustomers({Key? key}) : super(key: key);
  _pilihMenuCustomers createState() => _pilihMenuCustomers();
}

class _pilihMenuCustomers extends State<pilihMenuCustomers> {
  final user = FirebaseAuth.instance.currentUser!;

  CollectionReference database = FirebaseFirestore.instance.collection('users');
  Widget build(BuildContext context) {
    final uid = user.uid;
    final email = user.email as String;

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
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => cleanhomecustomer()));
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
                                    builder: (context) => profileCustomers()));
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
                        padding: EdgeInsets.only(top: 0, bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => saldoMyservant()));
                          },
                          child: Text('TOP UP Saldo MyServant'),
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.green,
                              shape: StadiumBorder(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 90, vertical: 15)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => chatpageToART(
                                          email: email,
                                        )));
                          },
                          child: Text('CHAT ART'),
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.green,
                              shape: StadiumBorder(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 85, vertical: 15)),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => chatpageCustomers(
                                          email: email,
                                        )));
                          },
                          child: Text('GROUP CHAT CUSTOMERS'),
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.green,
                              shape: StadiumBorder(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 85, vertical: 15)),
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
              return Center(child: CircularProgressIndicator());
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
