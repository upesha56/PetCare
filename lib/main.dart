import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/petregistration.dart';
import 'package:flutter_application_1/pages/recordbook.dart';
import 'package:flutter_application_1/pages/sample_page.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:flutter_application_1/pages/userprofile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: RecordBookPage());
  }
}
