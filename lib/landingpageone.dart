import 'package:flutter/material.dart';
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
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage(Assets.img2),
            fit: BoxFit.cover,
          ),        ),
        child:Container(
          padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.1 ),
          color: Color(0xFF3B335B).withOpacity(0.85),


          child: Column(

            children: [

              SizedBox(height: MediaQuery.of(context).size.height*0.45,),

              Text("Protect your loved ones",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                ),
              ),

              Text("Help your loved ones stay safe and give yourself peace of mind whenever they go",
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