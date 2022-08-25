import 'package:flutter/material.dart';
import 'package:go_safe/auth_screens/signin.dart';
import 'package:go_safe/res/Assets.dart';


class LandingPageOne extends StatefulWidget{
   @override
  _LandingPageOne createState() => _LandingPageOne();
}

class _LandingPageOne extends  State<LandingPageOne> {
  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(Assets.img2),
            fit: BoxFit.cover,
          ),        ),
        child:Container(
          padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.1 ),
          color: const Color(0xFF3B335B).withOpacity(0.85),


          child: Column(

            children: [

              SizedBox(height: MediaQuery.of(context).size.height*0.45,),

              const Text("Protect your loved ones",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const Text("Help your loved ones stay safe and give yourself peace of mind whenever they go",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFFA2A0A0),
                    fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.2,),

              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
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