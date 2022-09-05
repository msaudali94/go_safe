import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';
import 'package:go_safe/res/toasts.dart';
import 'package:go_safe/screens/homeuser.dart';
import 'package:go_safe/screens/profileuser.dart';
import 'package:go_safe/screens/settings.dart';
import 'package:location/location.dart';

class ShareRideDetails extends StatefulWidget{
  @override
  _ShareRideDetails createState() => _ShareRideDetails();
}

class _ShareRideDetails extends  State<ShareRideDetails> {
  final plateNumberController = TextEditingController();
  late StreamSubscription<LocationData> subscription;
  Location location = Location();
  LocationData? currentLocation;
  bool userWantToShareLiveLocation=false;

  @override
  void initState() {
    subscription =
        location.onLocationChanged.listen((clocation) {
          currentLocation = clocation;
          print("currentLocation$currentLocation");
          sendLatLongToFirebase(location: "UserLocation");
        });
    super.initState();
  }

  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context){
    // if(userWantToShareLiveLocation)
    // {
    //   subscription =
    //       location.onLocationChanged.listen((clocation) {
    //         currentLocation = clocation;
    //         print("currentLocation$currentLocation");
    //         sendLatLongToFirebase(location: "UserLocation");
    //       });
    // }
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

                  const Icon(Icons.local_taxi,
                    color: Colors.white,
                    size: 80,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  const Text("Ride Details ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.14,),


                  const Text("Enter car plate number    ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),),

                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  TextFormField(
                    controller: plateNumberController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color:Colors.transparent),
                        borderRadius: BorderRadius.circular(5.5),),

                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color:Colors.transparent),
                        borderRadius: BorderRadius.circular(5.5),),

                      hintText: "Stk-926",
                      hintStyle: const TextStyle(
                        color: Color(0xFFA2A0A0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.08,),







                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white, // Background color
                            minimumSize: const Size(100, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            )
                        ),
                        onPressed: () async {
                          if(plateNumberController.text.isEmpty)
                            {
                              Toasts.getWarningToast(text: "Kindly enter car plate number");
                            }
                          else
                            {
                              await FirebaseFirestore.instance
                                  .collection('/UserPlateNumber')
                                  .doc(FirebaseAuth.instance.currentUser?.email).set({
                                "PlateNumber":plateNumberController.text.trim(),
                                "latitude":currentLocation?.latitude,
                                "longitude":currentLocation?.longitude
                              }).then((value) {
                                Toasts.getSuccessToast(text: "Ride Details Shared Successfully");
                              });
                              setState(() {
                                userWantToShareLiveLocation=true;
                              });

                            }
                        },
                        child: Icon(Icons.share_location  ,
                          color: Colors.deepPurpleAccent.shade100,
                          size: 50,
                        ),
                      ),



                  SizedBox(height: MediaQuery.of(context).size.height*0.01),

                      const Text("Share ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),),


                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),


                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  },

                    icon: const Icon(Icons.arrow_back,
                      color: Colors.white,
                      size: 50,
                    ),),


                  SizedBox(height: MediaQuery.of(context).size.height*0.06,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeUser()));
                        },

                        icon: const Icon(Icons.home,
                          color: Colors.white,
                          size: 40,
                        ),),


                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const UserSettings()));
                      },

                        icon: const Icon(Icons.settings,
                          color: Colors.white,
                          size: 40,
                        ),),


                      IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileUser()));
                        },

                        icon: const Icon(Icons.person,
                          color: Colors.white,
                          size: 40,
                        ),),


                      IconButton(onPressed: (){},

                        icon: const Icon(Icons.directions_car,
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






  Future<void> sendLatLongToFirebase({required location}) async {
    await FirebaseFirestore.instance
        .collection('$location')
        .doc("${FirebaseAuth.instance.currentUser?.email}")
        .set({
      "latitude": currentLocation?.latitude,
      "longitude": currentLocation?.longitude,
      // "name": "${FirebaseAuth.instance.currentUser?.displayName}"
    });
  }

}