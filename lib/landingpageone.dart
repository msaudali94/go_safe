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
          color: Color(0xFF3A1772).withOpacity(0.64),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.45,),
              Text("Protect your loved ones",
                style: TextStyle(color: Colors.white, fontSize: 30.0),),
              Text("Help your loved ones stay safeand give yourself peace of mindwhenever they go",
                style: TextStyle(color: Colors.white, fontSize: 16.0),)
            ],
          ),
        )

      ),

    );
  }
}