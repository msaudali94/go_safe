import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';
import 'package:go_safe/screens/emergency.dart';
import 'package:go_safe/screens/profileguardian.dart';
import 'package:go_safe/screens/ridedetails.dart';
import 'package:go_safe/screens/settingguardian.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';



class HomeGuardian extends StatefulWidget{
  const HomeGuardian({Key? key}) : super(key: key);

  @override
  _HomeGuardian createState() => _HomeGuardian();
}

class _HomeGuardian extends  State<HomeGuardian> {





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

                  Container(
                    height: MediaQuery.of(context).size.height*0.1,
                    width: MediaQuery.of(context).size.height*0.1,

                    decoration: BoxDecoration(
                      color: Colors.grey,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius:  BorderRadius.all(Radius.circular(MediaQuery.of(context).size.height*0.08))
                    ),
                    child: Icon(Icons.person, size: MediaQuery.of(context).size.height*0.08,),
                    //child: Image

                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),


                  const Text("Stay connected with your loved ones ",
                    style: TextStyle(
                      color: Color(0xFFA2A0A0),
                      fontSize: 17.0,
                      fontWeight: FontWeight.w400,
                    ),),

                  SizedBox(height: MediaQuery.of(context).size.height*0.08,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Background color
                            minimumSize: const Size(100, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            )
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Emergency()));

                        },

                        child: const Icon(Icons.warning,
                          color: Colors.redAccent,
                          size: 50,
                        ),
                      ),



                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [

                      Text("View Emergency Status",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),),


                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Background color
                            minimumSize: const Size(100, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            )
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const RideDetails()));
                        },

                        child: const Icon(Icons.local_taxi,
                          color: Colors.redAccent,
                          size: 50,
                        ),
                      ),




                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [

                      Text("View Ride Details",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),),



                    ],
                  ),





                  SizedBox(height: MediaQuery.of(context).size.height*0.24,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      IconButton(onPressed: (){},

                        icon: const Icon(Icons.home,
                          color: Colors.blueAccent,
                          size: 40,
                        ),),


                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsGuardian()));
                      },

                        icon: const Icon(Icons.settings,
                          color: Colors.white,
                          size: 40,
                        ),),


                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileGuardian()));
                      },

                        icon: const Icon(Icons.person,
                          color: Colors.white,
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