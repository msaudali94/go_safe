import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';
import 'homeguardian.dart';
import 'settingguardian.dart';
import 'profileguardian.dart';
import 'livelocation.dart';
import 'batterystatus.dart';


class Emergency extends StatefulWidget{
  @override
  _Emergency createState() => _Emergency();
}

class _Emergency extends  State<Emergency> {


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

                SizedBox(height: MediaQuery.of(context).size.height*0.08,),


                Icon(Icons.warning,
                  color: Colors.white,
                  size: 80,
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                Text("Emergency",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),


                SizedBox(height: MediaQuery.of(context).size.height*0.1,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LiveLocation()));
                      },

                      child: Icon(Icons.location_on,
                        color: Colors.redAccent,
                        size: 50,
                      ),
                    ),



                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, // Background color
                          minimumSize: const Size(100, 100),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(35.0),
                          )
                      ),
                      onPressed: () {},

                      child: Icon(Icons.volume_up,
                        color: Colors.redAccent,
                        size: 50,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.01,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Text("View Location",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                      ),),

                    Text("Listen Audio",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                      ),),

                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.04,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BatteryStatus()));
                      },

                      child: Icon(Icons.battery_3_bar_sharp,
                        color: Colors.redAccent,
                        size: 50,
                      ),
                    ),



                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, // Background color
                          minimumSize: const Size(100, 100),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(35.0),
                          )
                      ),
                      onPressed: () {},

                      child: Icon(Icons.call,
                        color: Colors.redAccent,
                        size: 50,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.01,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Text("Battery",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                      ),),

                    Text("Call ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                      ),),

                  ],
                ),





                SizedBox(height: MediaQuery.of(context).size.height*0.2,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeGuardian()));
                    },

                      icon: Icon(Icons.home,
                        color: Colors.white,
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


                    IconButton(onPressed: (){},

                      icon: Icon(Icons.warning,
                        color: Colors.blueAccent,
                        size: 40,
                      ),),

                  ],
                ),


              ],
            ),

          )

      ),

    );
  }
}