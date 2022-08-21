import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';
import 'settingguardian.dart';
import 'profileguardian.dart';
import 'emergency.dart';
import 'ridedetails.dart';


class HomeGuardian extends StatefulWidget{
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
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: new ExactAssetImage(Assets.logo),
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


                  Text("Stay connected with your loved ones ",
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
                            primary: Colors.white, // Background color
                            minimumSize: const Size(100, 100),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(35.0),
                            )
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Emergency()));

                        },

                        child: Icon(Icons.warning,
                          color: Colors.redAccent,
                          size: 50,
                        ),
                      ),



                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

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
                            primary: Colors.white, // Background color
                            minimumSize: const Size(100, 100),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(35.0),
                            )
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RideDetails()));
                        },

                        child: Icon(Icons.local_taxi,
                          color: Colors.redAccent,
                          size: 50,
                        ),
                      ),




                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

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

                        icon: Icon(Icons.home,
                          color: Colors.blueAccent,
                          size: 40,
                        ),),


                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsGuardian()));
                      },

                        icon: Icon(Icons.settings,
                          color: Colors.white,
                          size: 40,
                        ),),


                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileGuardian()));
                      },

                        icon: Icon(Icons.person,
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