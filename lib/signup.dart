import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'signin.dart';

class SignUp extends StatefulWidget{
  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends  State<SignUp> {

  final List<String> items = [
    'User',
    'Guardian',

  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: new ExactAssetImage(Assets.img4),
              fit: BoxFit.cover,
            ),        ),
          child:Container(
            padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.1 ),
            color: Colors.black.withOpacity(0.6),

            child: Column(

              children: [

                SizedBox(height: MediaQuery.of(context).size.height*0.1,),

                Text("Sign up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.08,),


                TextFormField(

                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),),

                    prefixIcon: Icon(
                      Icons.person,
                      size:30,
                      color: Color(0xFF2C141F).withOpacity(0.85),),

                    hintText: "Username",
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
                      size:30,
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
                      size:30,
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

                SizedBox(height: MediaQuery.of(context).size.height*0.04,),

                DropdownButtonHideUnderline(
                  child: DropdownButton2(

                      isExpanded: true,
                    hint: Row(
                      children:[
                        Icon(
                          Icons.supervisor_account_rounded,
                          size:30,
                          color: Color(0xFF2C141F).withOpacity(0.85),
                        ),

                        SizedBox(
                          width: 9,
                        ),
                        Expanded(
                          child: Text(
                            'Role',
                            style: TextStyle(
                              color: Color(0xFFA2A0A0),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((item) =>
                        DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              color: Color(0xFFA2A0A0),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_downward,
                    ),
                    iconSize: 30,
                    iconEnabledColor: Color(0xFF2C141F).withOpacity(0.85),
                    buttonHeight: 62,
                    buttonWidth: 450,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.5),

                      color: Colors.white,
                    ),

                    itemHeight: 40,
                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                    dropdownMaxHeight: 200,
                    dropdownWidth: 300,
                    dropdownPadding: null,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.5),
                      color: Colors.white,
                    ),

                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.1,),



                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent, // Background color
                    minimumSize: const Size(400, 60),

                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {},

                  child: Text("Sign up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.02,),


                Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                      style: TextStyle(
                        color: Color(0xFFA2A0A0),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                      ),),

                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                    },
                      child: Text("Sign in",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),),),

                  ],
                ),










              ],
            ),

          )

      ),

    );
  }
}