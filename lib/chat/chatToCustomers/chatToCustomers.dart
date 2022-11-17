import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class chatToCustomers extends StatefulWidget {
  String email;
  String uidCustomers;
  chatToCustomers({required this.email, required this.uidCustomers});
  @override
  _chatToCustomers createState() =>
      _chatToCustomers(email: email, uidCustomers: uidCustomers);
}

class _chatToCustomers extends State<chatToCustomers> {
  String email;
  String uidCustomers;
  _chatToCustomers({required this.email, required this.uidCustomers});

  Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection('MessagesAntarCustomersART')
      .orderBy('time')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _messageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("something is wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          primary: true,
          itemBuilder: (_, index) {
            QueryDocumentSnapshot qs = snapshot.data!.docs[index];
            Timestamp t = qs['time'];
            DateTime d = t.toDate();
            print(d.toString());
            if (qs['email'] == email) {
              return Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Column(
                  crossAxisAlignment: email == qs['email']
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 300,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.purple,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: Text(
                          qs['email'],
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 200,
                              child: Text(
                                qs['messageART'],
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Text(
                              d.hour.toString() + ":" + d.minute.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (qs['uidCustomers'] == uidCustomers) {
              return Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Column(
                  crossAxisAlignment: email == qs['email']
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 300,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.purple,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: Text(
                          qs['email'],
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 200,
                              child: Text(
                                qs['messageCustomers'],
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Text(
                              d.hour.toString() + ":" + d.minute.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Visibility(
                visible: false,
                child: Text(''),
              );
            }
          },
        );
      },
    );
  }
}
