import 'package:flutter/material.dart';
import 'package:go_safe/auth_screens/signin.dart';
import 'package:go_safe/res/Assets.dart';

class LandingPageTwo extends StatefulWidget{
  const LandingPageTwo({Key? key}) : super(key: key);

  @override
  _LandingPageTwo createState() => _LandingPageTwo();
}

class _LandingPageTwo extends  State<LandingPageTwo> {
  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(Assets.img1),
              fit: BoxFit.cover,
            ),        ),
          child:Container(
            padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.1 ),
            color: const Color(0xFF631C18).withOpacity(0.85),

            child: Column(

              children: [

                SizedBox(height: MediaQuery.of(context).size.height*0.38,),

                const Text("Protect employees ,members, students",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const Text("Your employees, members, and students will never walk alone. if any trouble, they can instantly get help.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFA2A0A0),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.2,),

                TextButton(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn()));
                },
                  child: const Text("Sign in",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),)





              ],
            ),

          )

      ),

    );
  }
}