import 'package:flutter/material.dart';
import 'package:go_safe/FirebaseAuthService/firebaseauthservice.dart';
import 'package:go_safe/auth_screens/signin.dart';
import 'package:go_safe/res/Assets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:go_safe/res/toasts.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget{
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends  State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController =  TextEditingController();
  final TextEditingController emailController =  TextEditingController();
  final TextEditingController numberController =  TextEditingController();
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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(Assets.img4),
              fit: BoxFit.cover,
            ),        ),
          child:SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.1 ),
              color: Colors.black.withOpacity(0.6),
              child: Column(

                children: [

                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),

                  const Text("Sign up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.08,),


                  TextFormField(
                    controller: nameController,

                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color:Colors.transparent),
                        borderRadius: BorderRadius.circular(5.5),),

                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color:Colors.transparent),
                        borderRadius: BorderRadius.circular(5.5),),

                      prefixIcon: Icon(
                        Icons.person,
                        size:30,
                        color: const Color(0xFF2C141F).withOpacity(0.85),),

                      hintText: "Username",
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
                    controller: numberController,

                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color:Colors.transparent),
                        borderRadius: BorderRadius.circular(5.5),),

                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color:Colors.transparent),
                        borderRadius: BorderRadius.circular(5.5),),

                      prefixIcon: Icon(
                        Icons.phone,
                        size:30,
                        color: const Color(0xFF2C141F).withOpacity(0.85),),

                      hintText: "Number",
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
                        setState(() {
                          debugPrint("$selectedValue");
                          selectedValue = value as String;
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

                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),



                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent, // Background color
                      minimumSize: const Size(400, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      if(nameController.text.isEmpty)
                      {
                        Toasts.getErrorToast(text: "Kindly enter name!");
                      }
                      else if(emailController.text.isEmpty)
                      {
                        Toasts.getErrorToast(text: "Kindly enter email!");
                      }else if(numberController.text.isEmpty)
                      {
                        Toasts.getErrorToast(text: "Kindly enter number!");
                      }
                      else if(passwordController.text.isEmpty)
                      {
                        Toasts.getErrorToast(text: "Kindly enter password!");
                      }
                      else if(passwordController.text.length<8 )
                      {
                        Toasts.getErrorToast(text: "Password must contain 8 character");
                      }
                      else
                      {
                        context.read<AuthenticationService>().signUp(number:numberController.text.trim(),email: emailController.text.trim(), password: passwordController.text.trim(), name: nameController.text.trim(), role: selectedValue.toString()).then((value) => {
                          if(value=="weak-password")
                            {
                              Toasts.getErrorToast(text: "Weak Password!!")
                            }
                          else if( value=="email-already-in-use")
                            {
                              Toasts.getErrorToast(text: "The account already exists for that email")
                            }
                          else if(value=="something-went-wrong")
                              {
                                Toasts.getErrorToast(text: "Something Went Wrong!")
                              }else if(value=="signed-up")
                                {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignIn())),
                                  Toasts.getSuccessToast(text: "Successfully Signed Up!")
                                }
                              else
                                {
                                  Toasts.getErrorToast(text: "Something Went Wrong")
                                }
                        });
                      }
                    },
                    child: const Text("Sign up",
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
                      const Text("Already have an account?",
                        style: TextStyle(
                          color: Color(0xFFA2A0A0),
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),),

                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                      },
                        child: const Text("Sign in",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 17.0,
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