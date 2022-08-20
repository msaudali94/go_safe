import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';
import 'package:go_safe/screens/homeuser.dart';
import 'package:go_safe/screens/profileuser.dart';
import 'package:go_safe/screens/settings.dart';

class ShareRideDetails extends StatefulWidget{
  @override
  _ShareRideDetails createState() => _ShareRideDetails();
}

class _ShareRideDetails extends  State<ShareRideDetails> {


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

                Icon(Icons.local_taxi,
                  color: Colors.white,
                  size: 80,
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                Text("Ride Details ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.14,),


                Text("Enter car plate number    ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),),

                SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),),

                    hintText: "Stk-926",
                    hintStyle: TextStyle(
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
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(35.0),
                          )
                      ),
                      onPressed: () {},

                      child: Icon(Icons.share_location  ,
                        color: Colors.deepPurpleAccent.shade100,
                        size: 50,
                      ),
                    ),



                SizedBox(height: MediaQuery.of(context).size.height*0.01),

                    Text("Share ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                      ),),


                SizedBox(height: MediaQuery.of(context).size.height*0.04,),


                IconButton(onPressed: (){
                  Navigator.pop(context);
                },

                  icon: Icon(Icons.arrow_back,
                    color: Colors.white,
                    size: 50,
                  ),),


                SizedBox(height: MediaQuery.of(context).size.height*0.06,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HomeUser()));
                      },

                      icon: Icon(Icons.home,
                        color: Colors.white,
                        size: 40,
                      ),),


                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
                    },

                      icon: Icon(Icons.settings,
                        color: Colors.white,
                        size: 40,
                      ),),


                    IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileUser()));
                      },

                      icon: Icon(Icons.person,
                        color: Colors.white,
                        size: 40,
                      ),),


                    IconButton(onPressed: (){},

                      icon: Icon(Icons.directions_car,
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