import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SignIn extends StatefulWidget{
  @override
  _SignIn createState() => _SignIn();
}

class _SignIn extends  State<SignIn> {


  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: new ExactAssetImage(Assets.img3),
              fit: BoxFit.cover,
            ),        ),
          child:Container(
            padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.1 ),
            color: Colors.black.withOpacity(0.8),

            child: Column(

              children: [

                SizedBox(height: MediaQuery.of(context).size.height*0.1,),

                Text("Sign in",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.08,),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder:OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.transparent),
                    borderRadius: BorderRadius.circular(5.5),),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.transparent),
                    borderRadius: BorderRadius.circular(5.5),),

                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xFF2C141F).withOpacity(0.85),),

                  hintText: "Email",
                  hintStyle: TextStyle(
                    color: Color(0xFFA2A0A0),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),



                SizedBox(height: MediaQuery.of(context).size.height*0.04,),

                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),),

                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFF2C141F).withOpacity(0.85),),

                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Color(0xFFA2A0A0),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                TextButton(onPressed: (){},
                    child: Text("Forgot Password?",
                    style: TextStyle(
                      color: Color(0xFFA2A0A0),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),),),

                SizedBox(height: MediaQuery.of(context).size.height*0.04,),

        
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent, // Background color
          ),
          onPressed: () {},
          child: Text(
            'Sign in',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,),
          ),
        ),















              ],
            ),

          )

      ),

    );
  }
}