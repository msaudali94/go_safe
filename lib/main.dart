import 'package:flutter/material.dart';
import 'landingpageone.dart';
import 'landingpagetwo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Go Safe",
      home: LandingPageTwo()
      );
  }
}
