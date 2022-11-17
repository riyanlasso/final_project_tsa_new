import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tsa_new/listART.dart';
import 'package:final_project_tsa_new/login.dart';
import 'package:final_project_tsa_new/profileART.dart';
import 'package:final_project_tsa_new/pilihMenuART.dart';
import 'package:final_project_tsa_new/trackART.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class cleanhomeART2 extends StatefulWidget {
  const cleanhomeART2({Key? key}) : super(key: key);
  _cleanhomeART2 createState() => _cleanhomeART2();
}

class _cleanhomeART2 extends State<cleanhomeART2> {
  final user = FirebaseAuth.instance.currentUser!;
  List todos = List.empty();
  String title = "";
  String description = "";
  @override
  void initState() {
    super.initState();
    todos = ["Hello", "Hey There"];
  }

  createToDo() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyTodos").doc(title);

    Map<String, dynamic> todoList = {
      "todoTitle": title,
      "todoDesc": description,
      "emailTodo": '${user.email}',
      "DateTime": DateTime.now(),
    };

    documentReference
        .set(todoList)
        .whenComplete(() => print("Data stored successfully"));
  }

  deleteTodo(item) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyTodos").doc(item);

    documentReference
        .delete()
        .whenComplete(() => print("deleted successfully"));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final database =
        FirebaseFirestore.instance.collection("MyTodos").snapshots();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("MyTodos").snapshots(),
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
                  'TODO LIST',
                  style: TextStyle(fontSize: 30),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      QueryDocumentSnapshot<Object?>? documentSnapshot =
                          snapshot.data?.docs[index];

                      if (documentSnapshot!['emailTodo'] == '${user.email}') {
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      (documentSnapshot != null)
                                          ? ((documentSnapshot["todoDesc"] !=
                                                  null)
                                              ? documentSnapshot["todoDesc"]
                                              : "")
                                          : "",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  color: Colors.red,
                                  onPressed: () {
                                    setState(() {
                                      //todos.removeAt(index);
                                      deleteTodo((documentSnapshot != null)
                                          ? (documentSnapshot["todoTitle"])
                                          : "");
                                    });
                                  },
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  title: const Text("Add Todo"),
                  content: Container(
                    width: 400,
                    height: 100,
                    child: Column(
                      children: [
                        TextField(
                          decoration: new InputDecoration(hintText: 'Judul'),
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
          Icons.add,
          color: Colors.white,
        ),
      ),
      //bottomNavigationBar
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: IconTheme(
          data: const IconThemeData(color: Colors.white, size: 36),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => cleanhomeART2()));
                    },
                    icon: const Icon(Icons.home)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => trackLocationART()));
                    },
                    icon: const Icon(Icons.location_on)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.payment)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pilihMenuART()));
                    },
                    icon: const Icon(Icons.supervisor_account_rounded)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CardField(
    Size size,
    Color color,
    Icon icon,
    String title,
    String subtitle,
  ) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Card(
          child: SizedBox(
              height: size.height * .1,
              width: size.width * .39,
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: color,
                    child: icon,
                  ),
                  title: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  subtitle: Text(
                    subtitle,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                ),
              ))),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => login(),
      ),
    );
  }
}
