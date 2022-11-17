import 'package:cloud_firestore/cloud_firestore.dart';
import 'chatToCustomers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_project_tsa_new/login.dart';

class chatpageToCustomers extends StatefulWidget {
  String email;
  chatpageToCustomers({required this.email});
  @override
  _chatpageToCustomers createState() => _chatpageToCustomers(email: email);
}

class _chatpageToCustomers extends State<chatpageToCustomers> {
  String email;
  _chatpageToCustomers({required this.email});

  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController message = new TextEditingController();

  CollectionReference dataART = FirebaseFirestore.instance.collection('ART');
  final auth = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final uid = auth.uid;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Chat To Customers',
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
          future: dataART.doc(uid).get(),
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
                    child: (data['uidCustomers'] != null)
                        ? Column(
                            children: [
                              chatToCustomers(
                                email: email,
                                uidCustomers: data['uidCustomers'],
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
                                          'messageART': message.text.trim(),
                                          'time': DateTime.now(),
                                          'email': email,
                                          'uidART': uid,
                                          'uidCustomers': data['uidCustomers'],
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
                        : Text("Tidak Ada Customers"),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
