import 'package:chat/pages/community.dart';
import 'package:chat/pages/gps.dart';
import 'package:chat/pages/home_page.dart';
import 'package:chat/pages/loading_page.dart';
import 'package:chat/pages/loging_page.dart';
import 'package:chat/pages/petregistration_page.dart';
import 'package:chat/pages/recordbook_page.dart';
import 'package:chat/pages/signup_page.dart';
import 'package:chat/pages/store_page.dart';
import 'package:chat/pages/userprofile_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pet care App",
      home: login(),
    );
  }
}
