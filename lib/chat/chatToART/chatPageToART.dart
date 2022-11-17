import 'package:cloud_firestore/cloud_firestore.dart';
import 'chatToART.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_project_tsa_new/login.dart';

class chatpageToART extends StatefulWidget {
  String email;
  chatpageToART({required this.email});
  @override
  _chatpageToART createState() => _chatpageToART(email: email);
}

class _chatpageToART extends State<chatpageToART> {
  String email;
  _chatpageToART({required this.email});

  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController message = new TextEditingController();

  CollectionReference dataCustomers =
      FirebaseFirestore.instance.collection('users'); //uid yg dimiliki users
  final auth = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final uid = auth.uid;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Chat To ART',
          ),
          // actions: [
          //   MaterialButton(
          //     onPressed: () {
          //       _auth.signOut().whenComplete(() {
          //         Navigator.pushReplacement(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => login(),
          //           ),
          //         );
          //       });
          //     },
          //     child: Text(
          //       "signOut",
          //     ),
          //   ),
          // ],
        ),
        body: FutureBuilder(
          future: dataCustomers.doc(uid).get(),
          builder: (context, snapshot) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            // CollectionReference dataART =
            //     FirebaseFirestore.instance.collection('ART');
            // String uidART = '';
            // @override
            // void initState() {
            //   dataART.doc(data['uidART']).get().then((value) {
            //     var fields = value.data() as Map<String, dynamic>;
            //     setState(() {
            //       uidART = fields['uidART'];
            //     });
            //   });
            //   super.initState();
            // }
            // String uidART = data['uidART'];

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.79,
                    child: (data['uidART'] != null)
                        ? Column(
                            children: [
                              chatToART(
                                email: email,
                                uidART: data['uidART'],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: message,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.purple[100],
                                        hintText: 'message',
                                        enabled: true,
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 8.0, top: 8.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.purple),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.purple),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                      ),
                                      validator: (value) {},
                                      onSaved: (value) {
                                        message.text = value!;
                                      },
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      if (message.text.isNotEmpty) {
                                        fs
                                            .collection(
                                                'MessagesAntarCustomersART')
                                            .doc()
                                            .set({
                                          //ditambah doc(uid) agar bisa ke privat chat
                                          'messageCustomers':
                                              message.text.trim(),
                                          'time': DateTime.now(),
                                          'email': email,
                                          'emailART': data['emailART'],
                                          'uidART': data['uidART'],
                                          'uidCustomers': uid,
                                        });

                                        message.clear();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      }
                                    },
                                    icon: Icon(Icons.send_sharp),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Text("Tidak Ada ART"),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
