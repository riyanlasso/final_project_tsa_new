import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tsa_new/pilihMenuCustomers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class saldoMyservant extends StatefulWidget {
  const saldoMyservant({Key? key}) : super(key: key);
  _saldoMyservant createState() => _saldoMyservant();
}

class _saldoMyservant extends State<saldoMyservant> {
  final TextEditingController saldoController = new TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final keySaldo = GlobalKey<FormState>();
  late num saldo;
  Widget build(BuildContext context) {
    final uid = user.uid;
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: users.doc(uid).get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Container(
                  child: Center(
                    child: Form(
                      key: keySaldo,
                      child: Column(children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(top: 50, left: 15, right: 15),
                          child: Container(
                            // email
                            child: Row(
                              children: [
                                Flexible(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: saldoController,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'saldo',
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Isi Saldo Anda';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (keySaldo.currentState!.validate()) {
                              final uid = user.uid;
                              DocumentReference docUser = FirebaseFirestore
                                  .instance
                                  .collection("users")
                                  .doc(uid);
                              var valueSaldo = int.parse(saldoController.text);
                              var valueSaldo2 = data['saldo'] as num;
                              saldo = valueSaldo2 + valueSaldo;
                              docUser.update({
                                'saldo': saldo,
                              });
                              print('Saldo Berhasil Ditambahkan');
                              print(saldo);
                              saldoController.clear();
                              FocusManager.instance.primaryFocus?.unfocus();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          pilihMenuCustomers()));
                              sweatAlert();
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black87),
                              child: Center(
                                child: Text('BAYAR',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            children: [
                              Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    color: Color.fromARGB(221, 254, 255, 255)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'Dana.png',
                                      height: 150,
                                      width: 150,
                                    ),
                                    // Text('Saldo MyServant',
                                    //     style: TextStyle(
                                    //         color: Colors.white,
                                    //         fontSize: 20,
                                    //         fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    color: Color.fromARGB(221, 254, 255, 255)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'LinkAja.png',
                                      height: 100,
                                      width: 100,
                                    ),
                                    // Text('Saldo MyServant',
                                    //     style: TextStyle(
                                    //         color: Colors.white,
                                    //         fontSize: 20,
                                    //         fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    color: Color.fromARGB(221, 254, 255, 255)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'BRI.png',
                                      height: 100,
                                      width: 100,
                                    ),
                                    // Text('Saldo MyServant',
                                    //     style: TextStyle(
                                    //         color: Colors.white,
                                    //         fontSize: 20,
                                    //         fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }

  void sweatAlert() {
    Alert(
      context: context,
      type: AlertType.success,
      title: "TOP UP berhasil",
      desc: "Selamat anda TOP UP saldo MyServant",
    ).show();
  }

  // Future<void> editSaldo() async {
  //   final uid = user.uid;
  //   DocumentReference docUser =
  //       FirebaseFirestore.instance.collection("users").doc(uid);
  //   // FutureBuilder<DocumentSnapshot>(
  //   //     future: users.doc(uid).get(),
  //   //     builder: ((context, snapshot) {
  //   //       Map<String, dynamic> data =
  //   //           snapshot.data!.data() as Map<String, dynamic>;
  //   //     }));
  //   docUser.update({
  //     'saldo': saldo.text,
  //   });

  //   print('Saldo Berhasil Ditambahkan');
  // }
}
