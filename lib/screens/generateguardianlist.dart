import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:go_safe/models/guardian_list.dart';
import 'package:go_safe/res/Assets.dart';
import 'package:go_safe/res/toasts.dart';
import 'package:go_safe/screens/guardianlist.dart';
import 'settings.dart';
import 'profileuser.dart';
import 'homeuser.dart';

class GenerateGuardianList extends StatefulWidget{
  const GenerateGuardianList({Key? key}) : super(key: key);

  @override
  _GenerateGuardianList createState() => _GenerateGuardianList();
}

class _GenerateGuardianList extends  State<GenerateGuardianList> {
  final TextEditingController numberController=TextEditingController();
  GuardianListModel guardianListModel =GuardianListModel();
  String number="";
  String name="";
  String email="";
  String address="";
  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(Assets.logo),
              fit: BoxFit.cover,
            ),        ),
          child:Container(
            padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.1 ),
            color: Colors.black54.withOpacity(0.9),

            child: SingleChildScrollView(
              child: Column(

                children: [

                  SizedBox(height: MediaQuery.of(context).size.height*0.08,),

                  const Icon(Icons.shield,
                    color: Colors.white,
                    size: 80,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  const Text("Guardian List",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),


                  const Text("Enter the phone number    ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),),

                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  TextFormField(
                    controller: numberController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color:Colors.transparent),
                        borderRadius: BorderRadius.circular(5.5),),

                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color:Colors.transparent),
                        borderRadius: BorderRadius.circular(5.5),),

                      hintText: number==""?"0300-7628401":number,
                      hintStyle: const TextStyle(
                        color: Color(0xFFA2A0A0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),

                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(120))
                    ),
                    child: IconButton(onPressed: () async {
                      final snapshot1 = await FirebaseFirestore.instance
                          .collection('/Guardian1').get();
                      final snapshot2 = await FirebaseFirestore.instance
                          .collection('/Guardian2').get();

                      if (snapshot1.size == 0) {
                        FirebaseFirestore.instance
                            .collection('/Guardian1')
                            .doc(FirebaseAuth.instance.currentUser?.email).set({
                          "name":name,
                          "number":number
                        });
                        Toasts.getSuccessToast(text: "First Guardian added successfully");

                        print('it does not exist');
                      }
                      if ( snapshot2.size == 0 ) {
                        FirebaseFirestore.instance
                            .collection('/Guardian2')
                            .doc(FirebaseAuth.instance.currentUser?.email).set({
                          "name":name,
                          "number":number
                        });
                        Toasts.getSuccessToast(text: "Second Guardian added successfully");

                        print('it does not exist');
                      }
                      else
                        {
                          Toasts.getWarningToast(text: "Sorry!! More than two guardians are not allowed.");
                          // print('it exist');

                          // FirebaseFirestore.instance
                          //     .collection('/Guardian1')
                          //     .doc(FirebaseAuth.instance.currentUser?.email).set({
                          //   "name":name,
                          //   "number":number
                          // });
                        }


                    },
                     icon: const Icon(Icons.add,
                        color: Colors.blueAccent,
                        size: 32,
                      ),)

                  ),


                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),


                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white, // Background color
                            minimumSize: const Size(100, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            )
                        ),
                        onPressed: () async {
                              await ContactPickerPlatform.instance.requestPermission(force: true);
                          final FullContact contact =
                              await FlutterContactPicker.pickFullContact();
                          setState(() {
                            number= contact.phones.first.number??"";
                            name= "${contact.name?.firstName ?? ""} ${contact.name?.middleName ?? ""} ${contact.name?.lastName ?? ""}";
                            guardianListModel.number=number;
                            guardianListModel.name=name;

                            // email= contact.emails.first.email??"";
                            // address= contact.addresses.first.addressLine?.first??"";
                            // number= contact.phones.first.number??"";
                          });

                        },

                        child: Icon(Icons.contacts  ,
                          color: Colors.deepPurpleAccent.shade100,
                          size: 50,
                        ),
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white, // Background color
                            minimumSize: const Size(100, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            )
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => GuardianList()));
                        },

                        child: Icon(Icons.view_list  ,
                          color: Colors.deepPurpleAccent.shade100,
                          size: 50,
                        ),
                      ),

                    ],
                  ),



                  SizedBox(height: MediaQuery.of(context).size.height*0.01),

        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [


                  Text("Contacts ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w400,
                    ),),

              Text("View List ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                ),),

                  ],
        ),



                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),


                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  },

                    icon: const Icon(Icons.arrow_back,
                      color: Colors.white,
                      size: 50,
                    ),),


                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeUser()));
                      },

                        icon: const Icon(Icons.home,
                          color: Colors.white,
                          size: 40,
                        ),),


                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UserSettings()));
                      },

                        icon: const Icon(Icons.settings,
                          color: Colors.white,
                          size: 40,
                        ),),


                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileUser()));
                      },

                        icon: const Icon(Icons.person,
                          color: Colors.white,
                          size: 40,
                        ),),

                      IconButton(onPressed: (){},

                        icon: const Icon(Icons.view_list,
                          color: Colors.blueAccent,
                          size: 40,
                        ),),

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