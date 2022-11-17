import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tsa_new/paymentSaldoMyServant.dart';
import 'package:final_project_tsa_new/saldoMyservant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class payment2 extends StatefulWidget {
  const payment2({Key? key, required this.value2}) : super(key: key);
  final String value2;
  _payment2 createState() => _payment2();
}

class _payment2 extends State<payment2> {
  CollectionReference users = FirebaseFirestore.instance.collection('ART');
  CollectionReference CustomersData =
      FirebaseFirestore.instance.collection('users');
  final Customers = FirebaseAuth.instance.currentUser!;
  List<String> docID = [];

  Future getDocID() async {
    await FirebaseFirestore.instance
        .collection('ART')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
              docID.add(element.reference.id);
            }));
  }

  Widget build(BuildContext context) {
    final uid = Customers.uid;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(left: 20, right: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                //customersdata
                FutureBuilder<DocumentSnapshot>(
                  future: CustomersData.doc(uid).get(),
                  builder: (context, snapshot) {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Payment",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Saldo : Rp.${data['saldo']},-',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          // Container(
                          //   child: Text(
                          //     'DATA KONTRAK',
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.bold, fontSize: 25),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // Text(
                          //   'DATA DIRI CUSTOMERS / MAJIKAN',
                          // ),
                          Padding(
                              padding: EdgeInsets.only(
                                left: 25.0,
                                right: 25.0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Email Customers',
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
                                    child: Text(
                                      data['email'],
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                //data ART
                FutureBuilder<DocumentSnapshot>(
                    future: users.doc(widget.value2).get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        return Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                  left: 25.0,
                                  right: 25.0,
                                ),
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
                                      child: Text(
                                        data['email'],
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => paymentSaldoMS(
                                              value3: widget.value2,
                                            )));
                              },
                              child: Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black87),
                                child: Center(
                                  child: Text('Saldo MyServant',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
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
                                  border:
                                      Border.all(color: Colors.black, width: 2),
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
                                  border:
                                      Border.all(color: Colors.black, width: 2),
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
                                  border:
                                      Border.all(color: Colors.black, width: 2),
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
                            Container(
                              height: 200,
                              padding: EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total Biaya",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "\Rp. 10.000 ,-",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ],
            )),
      ),
    );
  }

  void sweatAlert(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Register berhasil",
      desc: "Selamat anda berhasil Register",
    ).show();
    return;
  }
}
