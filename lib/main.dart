import 'package:flutter/material.dart';
import 'landingpageone.dart';
import 'landingpagetwo.dart';
import 'signin.dart';
import 'signup.dart';
import 'homeuser.dart';
import 'settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Go Safe",
      home: Settings()
      );
  }
}
