import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tsa_new/getData.dart';
import 'package:final_project_tsa_new/profileART2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class listART extends StatefulWidget {
  const listART({Key? key}) : super(key: key);

  @override
  _listART createState() => _listART();
}

class _listART extends State<listART> {
  //document ID
  List<String> docID = [];
  // List<String> docIDAktif = [];

  late String value;
  late String value2;

  //get ID
  String uidART = '';
  String uidART2 = '';
  String uidCustomers = '';

  final Customers = FirebaseAuth.instance.currentUser!;
  CollectionReference ambilDataCustomers =
      FirebaseFirestore.instance.collection('users');
  @override
  void initState() {
    final uid = Customers.uid;
    ambilDataCustomers.doc(uid).get().then((value) {
      var fields = value.data() as Map<String, dynamic>;
      uidART = fields['uidART'];
      uidART2 = fields['uidART'];
      uidCustomers = fields['email'];
    });
    super.initState();
  }

  Future getDocID() async {
    await FirebaseFirestore.instance
        .collection('ART')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference.id);
              docID.add(element.reference.id);
              print(uidCustomers);
            }));
  }

  @override
  Widget build(BuildContext context) {
    final uid = Customers.uid;
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('DAFTAR ART'))),
      body: Center(
        child: Column(
          children: [
            // Text(uid),

            Expanded(
              child: FutureBuilder(
                future: getDocID(), //ID ART
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: docID.length,
                    itemBuilder: (context, index) {
                      // if (docID == uidART) {
                      //   return Text('sudah kontrak ${docID[index]}');
                      // } else if (docID != uidART) {
                      //   return Text('belum kontrak ${docID[index]}');
                      // } else {
                      //   return CircularProgressIndicator();
                      // }
                      // return Text('${docID[index]}');
                      return GestureDetector(
                        onTap: () {
                          print(docID[index]);
                          value = docID[index];
                          value2 = value;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => profileART2(
                                  value: value,
                                  value2: value,
                                  value3: value,
                                ),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              "profileART.png",
                            ),
                            title: getData(documentId: docID[index]),
                            subtitle: Text(
                              'Deskripsi',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
