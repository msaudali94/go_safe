import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/auth_screens/signin.dart';
import 'package:provider/provider.dart';
import 'screens/homeuser.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Go Safe",
      home: HomeUser()
      );
  }
}
class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key ?key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if(firebaseUser.emailVerified)
    {
      return  HomeUser();
    }
    else {
    return  SignIn();
    }
  }
}
