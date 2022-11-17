import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tsa_new/cleanhomeART.dart';
import 'package:final_project_tsa_new/cleanhomeART2.dart';
import 'package:final_project_tsa_new/cleanhomeCustomer.dart';

import 'package:final_project_tsa_new/signupart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:final_project_tsa_new/signupcustomer.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);
  @override
  State<login> createState() => _LoginPageState();
}

class _LoginPageState extends State<login> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  // final TextEditingController _controllerAlamat = TextEditingController();
  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  final List<String> items = [
    'Customer',
    'ART',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.only(top: 0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("morning.png"), fit: BoxFit.cover),
            ),
            child: Center(
                child: Padding(
              padding: EdgeInsets.only(top: 80),
              child: Column(
                children: <Widget>[
                  Image.asset('broom.png'),
                  const Text(
                    "MY SERVANT",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      height: 1.8,
                    ),
                  ),
                  Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          Padding(
                            // form email
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 30),
                            child: Container(
                              color: Color.fromARGB(255, 180, 180, 180),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'masukkan email anda'),
                              ),
                            ),
                          ),
                          Padding(
                            // form password
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 30),
                            child: Container(
                              color: Color.fromARGB(255, 180, 180, 180),
                              child: TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'masukkan password anda'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  const Text("Belum Punya akun ? "),
                                  Center(
                                    //signup dropdown button 2
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        isExpanded: true,
                                        hint: Row(
                                          children: const [
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Expanded(
                                              child: Text(
                                                'SIGN UP',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        items: items
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ))
                                            .toList(),
                                        value: selectedValue,
                                        onChanged: (value) {
                                          setState(() {
                                            // selectedValue = value as String;
                                            if (value == 'Customer') {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        signupcustomer()),
                                              );
                                            } else if (value == 'ART') {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        signupART()),
                                              );
                                            }
                                          });
                                        },
                                        buttonHeight: 30,
                                        buttonWidth: 160,
                                        buttonPadding: const EdgeInsets.only(
                                            left: 14, right: 14),
                                        buttonDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          border: Border.all(
                                            color: Colors.black26,
                                          ),
                                          color: Colors.blueAccent,
                                        ),
                                        buttonElevation: 2,
                                        itemHeight: 40,
                                        itemPadding: const EdgeInsets.only(
                                            left: 14, right: 14),
                                        dropdownMaxHeight: 200,
                                        dropdownWidth: 200,
                                        dropdownPadding: null,
                                        dropdownDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          color: Colors.redAccent,
                                        ),
                                        dropdownElevation: 8,
                                        scrollbarRadius:
                                            const Radius.circular(40),
                                        scrollbarThickness: 6,
                                        scrollbarAlwaysShow: true,
                                        offset: const Offset(-20, 0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            //button login
                            padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                signIn(emailController.text,
                                    passwordController.text);
                              },
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    width: 350,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 99, 231, 104),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('rool') == "customers") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => cleanhomecustomer(),
            ),
          );
        }
      } else {
        print('Move to roll ART');
      }
    });
  }

  void route2() {
    User? user2 = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('ART')
        .doc(user2!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('rool') == "ART") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => cleanhomeART2(),
            ),
          );
          // } else if (documentSnapshot.get('rool') == "ART") {
          //   Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => cleanhomeART(),
          //     ),
          //   );
        }
      } else {
        print('Move to roll customers');
      }
    });
  }

  Future<void> signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
        route2();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
