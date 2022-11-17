import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class getData extends StatelessWidget {
  final String documentId;
  final String rool = 'ART';
  getData({required this.documentId});
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('ART');
    Size size = MediaQuery.of(context).size;
    return Container(
      child: FutureBuilder<DocumentSnapshot>(
          future: users.doc(documentId).get(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              var image = data['imageUrl'];
              if (data['rool'] == 'ART') {
                // if (data['statuspekerjaan'] == 'AKTIF') {
                return Text('Email : ${data['email']}');
                // }
                // return Padding(
                //   padding: const EdgeInsets.only(left: 27),
                //   child: Container(
                //     //box1
                //     height: size.height * .15,
                //     width: size.width * .5,
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(8),
                //       image: DecorationImage(
                //           image: AssetImage('profileART.png')
                //           // image == null
                //           //     ? NetworkImage(data['imageUrl'])
                //           //     : Image.asset('profileART.png')
                //           ,
                //           fit: BoxFit.cover),
                //     ),
                //     child: Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(8),
                //         color: Colors.black.withOpacity(0.3),
                //       ),
                //       child: Padding(
                //         padding: EdgeInsets.only(left: 15, top: 10),
                //         child: Text(
                //           '${data['email']}',
                //           style: TextStyle(
                //               color: Colors.white,
                //               fontSize: 15,
                //               fontWeight: FontWeight.bold),
                //         ),
                //       ),
                //     ),
                //   ),
                // );
              }
            }
            return Center(child: CircularProgressIndicator());
          })),
    );
  }
}
