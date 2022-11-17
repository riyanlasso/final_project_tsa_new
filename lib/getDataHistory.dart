import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class getDataHistory extends StatelessWidget {
  final String documentId;

  getDataHistory({required this.documentId});
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('historyCustomers');
    return Container(
      child: FutureBuilder<DocumentSnapshot>(
          future: users.doc(documentId).get(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return Text('email : ${data['emailART']}');
            }
            return Center(child: CircularProgressIndicator());
          })),
    );
  }
}
