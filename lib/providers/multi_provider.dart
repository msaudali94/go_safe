
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_safe/FirebaseAuthService/firebaseauthservice.dart';
import 'package:provider/provider.dart';

final multiProviders = [

  Provider<AuthenticationService> (create: (_)=>AuthenticationService(FirebaseAuth.instance),),
  StreamProvider(create: (context)=>context.read<AuthenticationService>().authStateChanges, initialData: null,)
];
