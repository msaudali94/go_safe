import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/models/User.dart' as FirebaseUser;
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

  Future<String> signIn({String? email, String? password, String? role, BuildContext ?context}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email!, password: password!).then((value) {
        {
          _firestore
              .collection('Users')
              .doc(role)
              .get()
              .then((value) {
            var userType = value.reference.id;
            if (userType == "Guardian") {
              Navigator.pushReplacement(
                  context!,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomeGuardian()));            }
            else if (userType == "User") {
              Navigator.pushReplacement(
                  context!,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomeUser()));            }
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
      {String? email, String? password, String? role, String? name}) async {
    try {
      _firebaseAuth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
            if(value.additionalUserInfo?.isNewUser??false)
              {
                FirebaseUser.User user =
                FirebaseUser.User(name: name, email: email, role: role);
                await db.add(user.toJson());
              }
          // _firestore
          //           .collection('/users')
          //           .doc(_firebaseAuth.currentUser?.uid)
          //           .set({
          //         'name': name,
          //         'email': email,
          //         'role': role
          //         // 'profileImageUrl': '',
          //       });
              })
      ;
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
