import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tsa_new/chat/chatToART/chatPageToART.dart';
import 'package:final_project_tsa_new/chat/chatToART/chatToART.dart';
import 'package:final_project_tsa_new/cleanhomeCustomer.dart';

import 'package:final_project_tsa_new/getData.dart';
import 'package:final_project_tsa_new/listART.dart';

import 'package:final_project_tsa_new/halamanPayment.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class profileART2 extends StatefulWidget {
  const profileART2(
      {Key? key,
      required this.value,
      required this.value2,
      required this.value3})
      : super(key: key);
  final String value;
  final String value2;
  final String value3;

  // final String title;
  @override
  _profileART2 createState() => _profileART2();
}

class _profileART2 extends State<profileART2> {
  Container buildPost() {
    //comment
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Card(
        margin: EdgeInsets.all(0.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              // color: Color.fromARGB(255, 0, 0, 0),
                              border: Border.all(
                                  color: Color.fromARGB(255, 184, 157, 157),
                                  width: 2),
                              shape: BoxShape.circle),
                          child: Image.asset('profileART.png'),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Text("gfihfigia"),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem(
                          value: "delete",
                          child: Text("Delete Post"),
                        ),
                        PopupMenuItem(
                          value: "save",
                          child: Text("Save Post"),
                        ),
                      ];
                    },
                    child: Icon(Icons.arrow_drop_down),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    "HELLOHELLOHELLOHELLOHELLOHELLOHELLOHELLOHELLOHELLOHELLOHELLOHELLO",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CollectionReference dataART = FirebaseFirestore.instance.collection('ART');
  String uidART = '';
  String uidCustomers = '';
  String emailCustomers = '';
  String alamatCustomers = '';
  String teleponcustomers = '';
  String imageUrl = '';
  @override
  void initState() {
    dataART.doc().get().then((value) {
      var fields = value.data() as Map<String, dynamic>;
      setState(() {
        uidART = fields['uidART'];
        imageUrl = fields['imageUrl'];
        uidCustomers = fields['uidCustomers'];
        emailCustomers = fields['emailCustomers'];
        alamatCustomers = fields['alamatCustomers'];
        teleponcustomers = fields['Phone Number'];
      });
    });
    super.initState();
  }

  List todos = List.empty();
  String title = "";
  String description = "";

  createToDo() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Komentar").doc(title);

    Map<String, dynamic> todoList = {
      "todoTitle": title,
      "todoDesc": description,
      "uidCustomers": '${Customers.uid}',
      "uidART": '${widget.value}',
      "DateTime": DateTime.now(),
    };

    documentReference
        .set(todoList)
        .whenComplete(() => print("Data stored successfully"));
  }

  deleteTodo(item) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Komentar").doc(item);

    documentReference
        .delete()
        .whenComplete(() => print("deleted successfully"));
  }

  final Customers = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('ART');
    Size size = MediaQuery.of(context).size;
    final uid = Customers.uid;
    final email = Customers.email as String;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<DocumentSnapshot>(
                future: users.doc(widget.value).get(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;

                    if (data['rool'] == 'ART') {
                      // return Text('email : ${data['email']}');
                      return Column(children: [
                        Stack(
                          children: [
                            Container(
                              width: size.width,
                              height: 275,
                              color: Colors.transparent,
                              padding: EdgeInsets.only(bottom: 0),
                              child: Container(
                                width: size.width,
                                height: 650,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.elliptical(10, 10),
                                    bottomRight: Radius.elliptical(10, 10),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage('banner.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),

                            // * 1 backbutton (Row widget)
                            Row(
                              children: [
                                IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => listART()));
                                  },
                                  icon: Icon(Icons.arrow_back),
                                )
                              ],
                            ),

                            // * user profile image
                            Positioned(
                              top: 40,
                              left: size.width / 3.6,
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                    shape: BoxShape.circle),
                                child: (data['imageUrl'] == null)
                                    ? Image.asset('profileART.png')
                                    : Image.network(data['imageUrl']),
                              ),
                            ),
                          ],
                        ),
                        Container(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, right: 25.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text(
                                                      uidART,
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
                                                left: 18.0,
                                                right: 25.0,
                                                top: 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text(
                                                      'Email',
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
                                                left: 18.0,
                                                right: 25.0,
                                                top: 2.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Flexible(
                                                  child: Text(
                                                    data['email'],
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 18.0,
                                                right: 25.0,
                                                top: 25.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text(
                                                      'Alamat',
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
                                                left: 18.0,
                                                right: 25.0,
                                                top: 2.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Flexible(
                                                  child: Text(
                                                    data['Alamat'],
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 18.0,
                                                right: 25.0,
                                                top: 25.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text(
                                                      'Nomor Telepon',
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
                                                left: 18.0,
                                                right: 25.0,
                                                top: 2.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Flexible(
                                                  child: Text(
                                                    data['Phone Number'],
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 18.0,
                                                right: 25.0,
                                                top: 25.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text(
                                                      'keahlian',
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
                                                left: 18.0,
                                                right: 25.0,
                                                top: 2.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Flexible(
                                                  child: Text(
                                                    data['Keahlian'],
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 18.0,
                                                right: 25.0,
                                                top: 25.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
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
                                                left: 18.0,
                                                right: 25.0,
                                                top: 2.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Flexible(
                                                  child: Text(
                                                    data['gajiHarapan'],
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                    //button
                                    padding: const EdgeInsets.all(8.0),
                                    child: (uid != data['uidCustomers'])
                                        ? Container(
                                            height: 50,
                                            width: 350,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 99, 231, 104),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                var value2 = widget.value;
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          payment2(
                                                            value2: value2,
                                                          )),
                                                );
                                              },
                                              child: Text(
                                                'HIRE',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25),
                                              ),
                                            ),
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 99, 231, 104),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    var value2 = widget.value;
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              chatpageToART(
                                                                  email:
                                                                      email)),
                                                    );
                                                  },
                                                  child: Text(
                                                    'CHAT',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Container(
                                                height: 50,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 99, 231, 104),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    launch(
                                                        'tel://${data['Phone Number']}');
                                                    // FlutterPhoneDirectCaller
                                                    //     .callNumber(
                                                    //         '+58656496');
                                                    // var value2 = widget.value;
                                                    // Navigator.push(
                                                    //   context,
                                                    //   MaterialPageRoute(
                                                    //       builder: (context) =>
                                                    //           payment2(
                                                    //             value2: value2,
                                                    //           )),
                                                    // );
                                                  },
                                                  child: Text(
                                                    'TELEPON',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                //komentar
                                // Column(
                                //   children: <Widget>[
                                //     buildPost(),
                                //     buildPost(),
                                //     buildPost(),
                                //     buildPost()
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ]);
                    }
                  }
                  return Center(child: CircularProgressIndicator());
                })),
            // Column(
            //   children: <Widget>[
            //     buildPost(),
            //     buildPost(),
            //     buildPost(),
            //     buildPost()
            //   ],
            // ),
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("Komentar").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                } else if (snapshot.hasData || snapshot.data != null) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'KOMENTAR',
                        style: TextStyle(fontSize: 20),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            QueryDocumentSnapshot<Object?>? documentSnapshot =
                                snapshot.data?.docs[index];

                            if (documentSnapshot!['uidART'] ==
                                '${widget.value}') {
                              return Dismissible(
                                  key: Key(index.toString()),
                                  child: Card(
                                    elevation: 4,
                                    child: ListTile(
                                      title: Text(
                                        (documentSnapshot != null)
                                            ? (documentSnapshot["todoTitle"])
                                            : "",
                                        style: TextStyle(fontSize: 21),
                                      ),
                                      subtitle: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            (documentSnapshot != null)
                                                ? ((documentSnapshot[
                                                            "todoDesc"] !=
                                                        null)
                                                    ? documentSnapshot[
                                                        "todoDesc"]
                                                    : "")
                                                : "",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                            }
                            return Visibility(
                              visible: false,
                              child: Text(''),
                            );
                          })
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.red,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  title: const Text("Berikan Komentar"),
                  content: Container(
                    width: 400,
                    height: 100,
                    child: Column(
                      children: [
                        TextField(
                          decoration: new InputDecoration(hintText: 'Judul'),
                          enabled: true,
                          onChanged: (String value) {
                            title = value;
                          },
                        ),
                        TextField(
                          decoration:
                              new InputDecoration(hintText: 'Deskripsi'),
                          onChanged: (String value) {
                            description = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          setState(() {
                            //todos.add(title);
                            createToDo();
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text("Add"))
                  ],
                );
              });
        },
        child: const Icon(
          Icons.comment,
          color: Colors.white,
        ),
      ),
    );
  }
}
