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
        child: Image.asset(Assets.img2),


      ),

    );
  }
}