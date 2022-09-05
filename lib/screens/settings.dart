import 'package:flutter/material.dart';
import 'package:go_safe/FirebaseAuthService/firebaseauthservice.dart';
import 'package:go_safe/auth_screens/signin.dart';
import 'package:go_safe/res/Assets.dart';
import 'package:provider/provider.dart';
import 'accountuser.dart';
import 'notificationuser.dart';
import 'homeuser.dart';
import 'profileuser.dart';


class UserSettings extends StatefulWidget{
  const UserSettings({Key? key}) : super(key: key);

  @override
  _UserSettings createState() => _UserSettings();
}

class _UserSettings extends  State<UserSettings> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(Assets.logo),
              fit: BoxFit.cover,
            ),),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            color: Colors.black54.withOpacity(0.9),

            child: Column(

              children: [

                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.1,),

                const Text("Settings",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.08,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    const Icon(Icons.person_outline,
                      color: Colors.white,
                      size: 30,
                    ),

                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AccountUser()));
                    },
                      child: const Text("Account ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),),),
                  ],
                ),


                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    const Icon(Icons.notifications_none,
                      color: Colors.white,
                      size: 30,
                    ),

                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationUser()));
                    },
                      child:const Text("Notification ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),),),

                  ],
                ),


                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    const  Icon(Icons.lock_outline,
                      color: Colors.white,
                      size: 30,
                    ),

                    TextButton(onPressed: () {},
                      child:const Text("Privacy and Security ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),),),

                  ],
                ),


                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    const Icon(Icons.headphones,
                      color: Colors.white,
                      size: 30,
                    ),

                    TextButton(onPressed: () {},
                      child:const Text("Help and Support ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),),),

                  ],
                ),


                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    const Icon(Icons.help_outline,
                      color: Colors.white,
                      size: 30,
                    ),

                    TextButton(onPressed: () {},
                      child: const Text("About ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),),),


                  ],
                ),


                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    const  Icon(Icons.logout,
                      color: Colors.redAccent,
                      size: 30,
                    ),

                    TextButton(onPressed: () async {
                      await context.read<AuthenticationService>().signOut().then((value){
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>const SignIn()
                            ),
                                (Route<dynamic> route) => false);
                      });
                    },
                      child:const Text("Logout ",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),),),

                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.06,),

                IconButton(onPressed: (){
                  Navigator.pop(context);
                },

                  icon:const Icon(Icons.arrow_back,
                    color: Colors.white,
                    size: 50,
                  ),),

                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),



                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeUser()));
                    },

                      icon:const Icon(Icons.home,
                        color: Colors.white,
                        size: 40,
                      ),),


                    IconButton(onPressed: () {},

                      icon:const Icon(Icons.settings,
                        color: Colors.blueAccent,
                        size: 40,
                      ),),


                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileUser()));
                    },

                      icon:const Icon(Icons.person,
                        color: Colors.white,
                        size: 40,
                      ),),

                  ],
                ),

              ],
            ),

          )

      ),

    );
  }
}
