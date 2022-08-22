import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/FirebaseAuthService/firebaseauthservice.dart';
import 'package:go_safe/auth_screens/signup.dart';
import 'package:go_safe/res/Assets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:go_safe/res/toasts.dart';
import 'package:go_safe/screens/homeguardian.dart';
import 'package:go_safe/screens/homeuser.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget{
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignIn createState() => _SignIn();
}

class _SignIn extends  State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final List<String> items = [
    'User',
    'Guardian'
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(Assets.img3),
              fit: BoxFit.cover,
            ),        ),
          child:Container(
            padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.1 ),
            color: Colors.black.withOpacity(0.8),

            child: SingleChildScrollView(
              child: Column(

                children: [

                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),

                  const Text("Sign in",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.08,),

                TextFormField(
                  controller: emailController,

                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color:Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),),

                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color:Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),),

                    prefixIcon: Icon(
                      Icons.email,
                      size:30,
                      color: const Color(0xFF2C141F).withOpacity(0.85),),

                    hintText: "Email",
                    hintStyle: const TextStyle(
                      color: Color(0xFFA2A0A0),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),



                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),

                  TextFormField(
                    controller: passwordController,

                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color:Colors.transparent),
                        borderRadius: BorderRadius.circular(5.5),),

                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color:Colors.transparent),
                        borderRadius: BorderRadius.circular(5.5),),

                      prefixIcon: Icon(
                        Icons.lock,
                        size:30,
                        color: const Color(0xFF2C141F).withOpacity(0.85),),

                      hintText: "Password",
                      hintStyle: const TextStyle(
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
                            color: const Color(0xFF2C141F).withOpacity(0.85),
                            ),

                          const SizedBox(
                            width: 9,
                          ),
                          const Expanded(
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
                        debugPrint(selectedValue);
                        selectedValue = value as String;
                        setState(() {

                        });
                      },
                      icon: const Icon(
                        Icons.arrow_downward,
                      ),
                      iconSize: 30,
                      iconEnabledColor: const Color(0xFF2C141F).withOpacity(0.85),
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

                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                  TextButton(onPressed: (){},
                      child: const Text("Forgot Password?",
                      style: TextStyle(
                        color: Color(0xFFA2A0A0),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),),),

                  SizedBox(height: MediaQuery.of(context).size.height*0.08,),


        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.blueAccent, // Background color
              minimumSize: const Size(400, 60),

              shape:  RoundedRectangleBorder(
                borderRadius:  BorderRadius.circular(30.0),
              ),
          ),
          onPressed: () {

              if (emailController.text.isEmpty) {
                Toasts.getErrorToast(text: "Kindly enter email!");
              } else if (passwordController.text.isEmpty) {
                // Util.showSnack(context, "Kindly enter password!");
                Toasts.getErrorToast(text: "Kindly enter password!");

              } else {
                context
                    .read<AuthenticationService>()
                    .signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    role: selectedValue,
                  context: context
                )
                    .then((value) async {
                  if(value=="user-not-found")
                  {
                    Toasts.getErrorToast(text: "No user found for that email.");
                  }
                  else if(value=="wrong-password")
                  {
                    Toasts.getErrorToast(text: "Wrong password provided for that user.");
                  }
                  else if(value=="signed-in")
                  {
                     Toasts.getSuccessToast(text: "Successfully signed in!!");
                  }
                  else
                  {
                    Toasts.getErrorToast(text: "Something Went Wrong!!");
                  }
                });
              }

          },

          child: const Text("Sign in",
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
                      const Text("Dont have an account?",
                        style: TextStyle(
                          color: Color(0xFFA2A0A0),
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                        ),),

                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));

                      },
                        child: const Text("Create new one",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                          ),),),

                    ],
                  ),
                ],
              ),
            ),
          )
      ),

    );
  }
}