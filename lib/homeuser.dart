import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';

class HomeUser extends StatefulWidget{
  @override
  _HomeUser createState() => _HomeUser();
}

class _HomeUser extends  State<HomeUser> {


  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: new ExactAssetImage(Assets.logo),
              fit: BoxFit.cover,
            ),        ),
          child:Container(
            padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.1 ),
            color: Colors.black54.withOpacity(0.9),

            child: Column(

              children: [

                SizedBox(height: MediaQuery.of(context).size.height*0.1,),

        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(60))
          ),
          //child: Image

        ),

                SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                Text("Hi Amanda",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),



                Text("We are looking out for you ",
                  style: TextStyle(
                    color: Color(0xFFA2A0A0),
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400,
                  ),),

                SizedBox(height: MediaQuery.of(context).size.height*0.02,),


              ],
            ),

          )

      ),

    );
  }
}