import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tsa_new/cleanhomeCustomer.dart';

import 'package:final_project_tsa_new/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class signupcustomer extends StatefulWidget {
  @override
  _signupcustomerstate createState() => _signupcustomerstate();
}

class _signupcustomerstate extends State<signupcustomer> {
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController alamatController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  var rool = "customers";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 40),
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset('broom.png'),
                const Text(
                  "DAFTAR CUSTOMER",
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
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 10,
                          ),
                          child: TextField(
                            // secure password
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'email',
                                hintText: 'masukkan email anda'),
                          ),
                        ),
                        Padding(
                          // form password
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 10,
                          ),
                          child: TextField(
                            controller: passwordController,
                            obscureText: true, // secure password
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'password',
                                hintText: 'masukkan password anda'),
                          ),
                        ),
                        Padding(
                          // form alamat
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 10),
                          child: TextField(
                            controller: alamatController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'alamat',
                                hintText: 'masukkan alamat anda'),
                          ),
                        ),
                        Padding(
                          // form telepon
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 10),
                          child: TextField(
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'telepon',
                                hintText: 'masukkan telepon anda'),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 99, 231, 104),
                              borderRadius: BorderRadius.circular(10)),
                          child: ElevatedButton(
                            onPressed: () {
                              signUp(
                                  emailController.text,
                                  passwordController.text,
                                  rool,
                                  phoneController.text,
                                  alamatController.text);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => cleanhomecustomer()),
                              // );
                            },
                            child: const Text(
                              'DAFTAR',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp(
    String email,
    String password,
    String rool,
    String phoneNumber,
    String alamat,
  ) async {
    CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              {postDetailsToFirestore(email, rool, phoneNumber, alamat)})
          .catchError((e) {});
    }
  }

  postDetailsToFirestore(
      String email, String rool, String phoneNumber, String alamat) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({
      'email': emailController.text,
      'rool': rool,
      'Phone Number': phoneController.text,
      'Alamat': alamatController.text,
      'saldo': 0
    });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => login()));
  }
}
