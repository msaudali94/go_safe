import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/auth_screens/signin.dart';
import 'package:go_safe/providers/multi_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'screens/homeuser.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  // ZegoEngineProfile profile = ZegoEngineProfile(
  //
  //        appID, // AppID format: 1234567890
  //
  //        ZegoScenario.General, // General scenario
  //
  // );

  // ZegoExpressEngine.createEngineWithProfile(profile);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: multiProviders,
      child: const MaterialApp(
        title:"Go Safe",
        home: AuthenticationWrapper()
        ),
    );
  }
}
class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key ?key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;

    // final firebaseUser = context.watch<User>();
    // bool isUserLoggedIn=false;
    // FirebaseAuth.instance
    //     .authStateChanges()
    //     .listen((User? user) {
    //   if (user == null) {
    //     isUserLoggedIn = false;
    //     print('User is currently signed out!');
    //   } else {
    //     isUserLoggedIn = true;
    //     print('User is signed in!');
    //   }
    // });
    if(currentUser != null)
    {
      return  const HomeUser();
    }
    else {
    return  const SignIn();
    }
  }
}
