import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tsa_new/cleanhomeCustomer.dart';
import 'package:final_project_tsa_new/saldoMyservant.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class paymentSaldoMS extends StatefulWidget {
  const paymentSaldoMS({Key? key, required this.value3}) : super(key: key);
  final String value3;
  _paymentSaldoMS createState() => _paymentSaldoMS();
}

class _paymentSaldoMS extends State<paymentSaldoMS> {
  final history = FirebaseFirestore.instance;
  CollectionReference ART = FirebaseFirestore.instance.collection('ART');
  CollectionReference CustomersData =
      FirebaseFirestore.instance.collection('users');
  final Customers = FirebaseAuth.instance.currentUser!;
  late num saldo;
  String emailART = '';
  String alamatART = '';
  String teleponART = '';
  String keahlianART = '';
  String gajiART = '';

  CollectionReference dataART = FirebaseFirestore.instance.collection('ART');
  @override
  void initState() {
    dataART.doc(widget.value3).get().then((value) {
      var fields = value.data() as Map<String, dynamic>;
      setState(() {
        emailART = fields['email'];
        alamatART = fields['Alamat'];
        teleponART = fields['Phone Number'];
        keahlianART = fields['Keahlian'];
        gajiART = fields['gajiHarapan'];
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    final uid = Customers.uid;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            //DATA ART
            FutureBuilder<DocumentSnapshot>(
              future: ART.doc(widget.value3).get(),
              builder: (context, snapshot) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Text(
                            'DATA KONTRAK',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'DATA DIRI ASISTEN RUMAH TANGGA',
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
                      ],
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            //ambil data Customers
            FutureBuilder<DocumentSnapshot>(
              future: CustomersData.doc(uid).get(),
              builder: (context, snapshot) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;

                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: [
                      Text(
                        'DATA DIRI CUSTOMERS / MAJIKAN',
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                                    'Saldo Customers',
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
                                  '${data['saldo']}',
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
                          final uid1 = Customers.uid;
                          final uid2 = widget.value3;
                          DocumentReference docUser = FirebaseFirestore.instance
                              .collection("users")
                              .doc(uid1);
                          DocumentReference docART = FirebaseFirestore.instance
                              .collection("ART")
                              .doc(uid2);

                          var valueSaldo = data['saldo'];
                          if (valueSaldo < 10000 || valueSaldo == null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => saldoMyservant()));
                            Alert(
                              context: context,
                              type: AlertType.error,
                              title: "pembayaran gagal",
                              desc:
                                  "Mohon maaf, saldo anda tidak mencukupi, saldo anda ${data['saldo']},silahkan TOP UP terlebih dahulu",
                            ).show();
                          } else if (valueSaldo >= 10000 ||
                              valueSaldo == 10000) {
                            saldo = valueSaldo - 10000;
                            print('Berhasil Bayar');
                            print('Saldo Anda Tersisa ${saldo}');
                            print(uid1);
                            print(uid2);
                            docUser.update({
                              'saldo': saldo,
                              'uidART': uid2,
                              'emailART': emailART,
                              'alamatART': alamatART,
                              'teleponART': teleponART,
                              'keahlianART': keahlianART,
                              'gajiHarapanART': gajiART,
                            });
                            docART.update({
                              'uidCustomers': uid1,
                              'emailCustomers': data['email'],
                              'alamatCustomers': data['Alamat'],
                              'teleponcustomers': data['Phone Number'],
                            });
                            history
                                .collection('historyCustomers')
                                .doc(uid1)
                                .set({
                              'uidCustomers': uid1,
                              'namaCustomers': data['email'],
                              'alamatCustomer': data['Alamat'],
                              'teleponCustomers': data['Phone Number'],
                              'uidART': uid2,
                              'emailART': emailART,
                              'alamatART': alamatART,
                              'teleponART': teleponART,
                              'keahlianART': keahlianART,
                              'gajiHarapanART': gajiART,
                              'statuspekerjaan': 'AKTIF',
                            });

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => cleanhomecustomer()));
                            Alert(
                              context: context,
                              type: AlertType.success,
                              title: "pembayaran berhasil",
                              desc:
                                  "Selamat, pembayaran anda berhasil, segera hubungi ART anda",
                            ).show();

                            // var setglobalUidART;
                            // setglobalUidART = widget.value3;
                            // var set2lobalUidART = setglobalUidART;
                            // appData1.globalUidART = set2lobalUidART;
                            // print(appData1.globalUidART);
                          }

                          // docUser.update({
                          //   'saldo': saldo,
                          // });
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
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            //ambil data ART
          ],
        ),
      )),
    );
  }
}
