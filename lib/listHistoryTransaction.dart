import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tsa_new/cleanhomeCustomer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class historyTransaction extends StatefulWidget {
  const historyTransaction({Key? key}) : super(key: key);
  _historyTransaction createState() => _historyTransaction();
}

class _historyTransaction extends State<historyTransaction> {
  final user = FirebaseAuth.instance.currentUser!;
  CollectionReference CustomersHistory =
      FirebaseFirestore.instance.collection('historyCustomers');
  List<String> docIDHistory = [];
  late String value;
  late String value2;
  CollectionReference dataART = FirebaseFirestore.instance.collection('ART');
  String uidART = '';
  String uidCustomers = '';
  String emailCustomers = '';
  String alamatCustomers = '';
  String teleponcustomers = '';
  @override
  void initState() {
    dataART.doc().get().then((value) {
      var fields = value.data() as Map<String, dynamic>;
      setState(() {
        uidART = fields['uidART'];
        uidCustomers = fields['uidCustomers'];
        emailCustomers = fields['emailCustomers'];
        alamatCustomers = fields['alamatCustomers'];
        teleponcustomers = fields['Phone Number'];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final uid = user.uid;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            FutureBuilder<DocumentSnapshot>(
                future: CustomersHistory.doc(uid).get(),
                builder: (context, snapshot) {
                  // return Container(
                  //   child: Column(
                  //     children: [
                  //       Text('${data['emailART']}'),
                  //       Text('${data['alamatART']}'),
                  //       Text('${data['teleponART']}'),
                  //       Text('${data['namaCustomers']}'),
                  //       Text('${data['alamatCustomer']}'),
                  //       Text('${data['teleponCustomers']}'),
                  //       Text('${data['statuspekerjaan']}'),
                  //     ],
                  //   ),
                  // );
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return Container(
                    child: ListTile(
                      title: Row(
                        children: [],
                      ),
                      subtitle: Column(
                        children: [
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
                                          left: 10.0, right: 25.0),
                                      child: Row(
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              SizedBox(
                                                height: 22,
                                              ),
                                              Text(
                                                'KONTRAK ART',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 24.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 25.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                'Email Customers',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child: Text(
                                              data['namaCustomers'],
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ),
                                        ],
                                      )),
                                  // Padding(
                                  //     padding: EdgeInsets.only(
                                  //         left: 18.0, right: 25.0, top: 25.0),
                                  //     child: Row(
                                  //       mainAxisSize: MainAxisSize.max,
                                  //       children: <Widget>[
                                  //         Column(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.start,
                                  //           mainAxisSize: MainAxisSize.min,
                                  //           children: <Widget>[
                                  //             Text(
                                  //               'UID ART',
                                  //               style: TextStyle(
                                  //                   color: Colors.black,
                                  //                   fontSize: 16.0,
                                  //                   fontWeight:
                                  //                       FontWeight.bold),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ],
                                  //     )),
                                  // Padding(
                                  //     padding: EdgeInsets.only(
                                  //         left: 18.0, right: 25.0, top: 2.0),
                                  //     child: Row(
                                  //       mainAxisSize: MainAxisSize.max,
                                  //       children: <Widget>[
                                  //         Flexible(
                                  //           child: Text(
                                  //             data['uidART'],
                                  //             style: TextStyle(fontSize: 17),
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 25.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                'Alamat Customers',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child: Text(
                                              data['alamatCustomer'],
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 25.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                'Telepon Customers',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child: Text(
                                              data['teleponCustomers'],
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                'Email ART',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child: Text(
                                              data['emailART'],
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 25.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                'Alamat ART',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child: Text(
                                              data['alamatART'],
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 25.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                'Nomor Telepon ART',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child: Text(
                                              data['teleponART'],
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 25.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                'Status Pekerjaan',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child: Text(
                                              data['statuspekerjaan'],
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 25.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                'Lama Kontrak Pekerjaan',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child: Text(
                                              '1 Tahun',
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 25.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                'Keahlian',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child: Text(
                                              data['keahlianART'],
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 25.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                'Gaji Harapan',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 18.0, right: 25.0, top: 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child: Text(
                                              data['gajiHarapanART'],
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                          // Container(
                          //   height: 50,
                          //   width: 350,
                          //   margin: EdgeInsets.only(bottom: 30),
                          //   decoration: BoxDecoration(
                          //       color: Colors.red,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   child: ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //       primary: Colors.blue,
                          //       textStyle: TextStyle(
                          //           fontSize: 30, fontWeight: FontWeight.bold),
                          //     ),
                          //     onPressed: () {
                          //       Navigator.pushReplacement(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) => cleanhomecustomer(),
                          //         ),
                          //       );
                          //     },
                          //     child: Text(
                          //       'KOMENTAR',
                          //       style: TextStyle(
                          //           color: Colors.white, fontSize: 25),
                          //     ),
                          //   ),
                          // ),
                          Container(
                            height: 50,
                            width: 350,
                            margin: EdgeInsets.only(bottom: 30),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                textStyle: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                late DocumentReference history;
                                final uid1 = user.uid;
                                history = FirebaseFirestore.instance
                                    .collection("historyCustomers")
                                    .doc(user.uid);
                                DocumentReference docUser = FirebaseFirestore
                                    .instance
                                    .collection("users")
                                    .doc(uid1);
                                DocumentReference docART = FirebaseFirestore
                                    .instance
                                    .collection("ART")
                                    .doc(data['uidART']);
                                docUser.update({
                                  'uidART': FieldValue.delete(),
                                  'emailART': FieldValue.delete(),
                                  'alamatART': FieldValue.delete(),
                                  'teleponART': FieldValue.delete(),
                                  'keahlianART': FieldValue.delete(),
                                  'gajiHarapanART': FieldValue.delete(),
                                  'statuspekerjaan': FieldValue.delete()
                                });
                                docART.update({
                                  'uidCustomers': FieldValue.delete(),
                                  'emailCustomers': FieldValue.delete(),
                                  'alamatCustomers': FieldValue.delete(),
                                  'teleponcustomers': FieldValue.delete(),
                                });
                                history.delete();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => cleanhomecustomer(),
                                  ),
                                );
                                Alert(
                                  context: context,
                                  type: AlertType.success,
                                  title: "Putus Kontrak berhasil",
                                ).show();
                              },
                              child: Text(
                                'PUTUS KONTRAK',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      )),
    );
  }
}
