import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';


class SafeMark extends StatefulWidget{
  @override
  _SafeMark createState() => _SafeMark();
}

class _SafeMark extends  State<SafeMark> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,


          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            color: Colors.white,

            child: Column(

              children: [

                SizedBox(height: MediaQuery.of(context).size.height * 0.08,),





                SizedBox(height: MediaQuery.of(context).size.height * 0.08,),



              ],
            ),

          )

      ),

    );
  }
}
