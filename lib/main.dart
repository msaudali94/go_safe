import 'package:flutter/material.dart';
import 'landingpageone.dart';
import 'landingpagetwo.dart';
import 'signin.dart';
import 'signup.dart';
import 'homeuser.dart';
import 'settings.dart';
import 'accountuser.dart';
import 'notificationuser.dart';
import 'profileuser.dart';
import 'sos.dart';
import 'safemark.dart';
import 'activatedfakecall.dart';
import 'fakecalltwo.dart';
import 'shareridedetails.dart';
import 'generateguardianlist.dart';
import 'settingguardian.dart';
import 'accountguardian.dart';
import 'notificationguardian.dart';
import 'profileguardian.dart';
import 'homeguardian.dart';
import 'emergency.dart';
import 'batterystatus.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Go Safe",
      home: SafeMark()
      );
  }
}
