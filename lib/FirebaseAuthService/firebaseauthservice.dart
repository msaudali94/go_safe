import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/screens/homeguardian.dart';
import 'package:go_safe/screens/homeuser.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference db = FirebaseFirestore.instance.collection('Users');

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn(
      {String? email,
      String? password,
      String? role,
      BuildContext? context}) async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) {
        {
          _firestore.collection('Users').doc(role).get().then((value) {
            var userType = value.reference.id;
            if (userType == "Guardian") {
              Navigator.pushReplacement(context!,
                  MaterialPageRoute(builder: (context) => const HomeGuardian()));
            } else if (userType == "User") {
              Navigator.pushReplacement(context!,
                  MaterialPageRoute(builder: (context) => const HomeUser()));
            }
          });
        }
      });
      return "signed-in";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'user-not-found.';
      } else if (e.code == 'wrong-password') {
        return 'wrong-password';
      } else {
        return 'something-went-wrong';
      }
    }
  }

  Future<String> signUp(
      {String? email,
      String? password,
      String? role,
      String? name,
      String? number}) async {
    try {
      _firebaseAuth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        if (value.additionalUserInfo?.isNewUser ?? false) {
          _firestore
              .collection('/Users')
              .doc(FirebaseAuth.instance.currentUser?.email)
              .set({
            'name': name,
            'email': email,
            'role': role,
            'number': number
          });
        }
      });
      return "signed-up";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'weak-password';
      } else if (e.code == 'email-already-in-use') {
        return 'email-already-in-use';
      } else {
        return 'something-went-wrong';
      }
    }
  }
}
