import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';

class LandingPageTwo extends StatefulWidget{
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
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: new ExactAssetImage(Assets.img1),
              fit: BoxFit.cover,
            ),        ),
          child:Container(
            padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.1 ),
            color: Color(0xFF631C18).withOpacity(0.85),


            child: Column(

              children: [

                SizedBox(height: MediaQuery.of(context).size.height*0.38,),

                Text("Protect employees ,members, students",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                Text("Your employees, members, and students will never walk alone. if any trouble, they can instantly get help.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFA2A0A0),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.2,),

                TextButton(onPressed: (){},
                  child: Text("Sign in",
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