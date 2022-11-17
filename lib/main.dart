import 'dart:developer';

import 'package:final_project_tsa_new/cleanhomeART.dart';
import 'package:final_project_tsa_new/cleanhomeCustomer.dart';
import 'package:final_project_tsa_new/listART.dart';
import 'package:final_project_tsa_new/login.dart';
import 'package:final_project_tsa_new/halamanPayment.dart';
import 'package:final_project_tsa_new/profileART.dart';
import 'package:final_project_tsa_new/profileART2.dart';
import 'package:final_project_tsa_new/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MYSERVANT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Mainpage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: login(),
        // StreamBuilder<User?>(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return const cleanhomecustomer();
        //     } else {
        //       return login();
        //     }
        //   },
        // ),
      );
}
