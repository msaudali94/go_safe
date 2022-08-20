
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService{
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
  Future<String> signIn({String ?email, String ?password})async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email!, password: password!);
      return "signed-in";
    } on FirebaseAuthException catch (e)
    {
      if (e.code == 'user-not-found') {
        return'user-not-found.';
      } else if (e.code == 'wrong-password') {
        return'wrong-password';
      }
      else
        {
          return'something-went-wrong';
        }
    }
}
  Future<String> signUp({String ?email, String ?password})async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email!, password: password!);
      return "signed-up";
    } on FirebaseAuthException catch (e)
    {
      if (e.code == 'weak-password') {
        return'weak-password';
      } else if (e.code == 'email-already-in-use') {
        return'email-already-in-use';
      }
      else
        {
          return'something-went-wrong';
        }
    }
}
}