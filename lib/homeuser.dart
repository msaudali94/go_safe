import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';

class HomeUser extends StatefulWidget{
  @override
  _HomeUser createState() => _HomeUser();
}

class _HomeUser extends  State<HomeUser> {


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


                Text("We are looking out for you ",
                  style: TextStyle(
                    color: Color(0xFFA2A0A0),
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400,
                  ),),

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
                      onPressed: () {},

                      child: Icon(Icons.shield,
                      color: Colors.deepPurpleAccent.shade100,
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

                      child: Icon(Icons.local_taxi,
                        color: Colors.deepPurpleAccent.shade100,
                        size: 50,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.01,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Text("Guardian List ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                      ),),

                    Text("Share Ride  ",
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
                      onPressed: () {},

                      child: Icon(Icons.add_location_alt,
                        color: Colors.deepPurpleAccent.shade100,
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
                        color: Colors.deepPurpleAccent.shade100,
                        size: 50,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.01,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Text("Mark Safe  ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                      ),),

                    Text("Fake Call ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                      ),),

                  ],
                ),


                SizedBox(height: MediaQuery.of(context).size.height*0.04,),

                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(100))
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurpleAccent, // Background color
                        minimumSize: const Size(80, 80),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(100.0),
                        )
                    ),
                    onPressed: () {},

                    child: Text("SOS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ),

                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.06,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    IconButton(onPressed: (){},

                        icon: Icon(Icons.home,
                          color: Colors.blueAccent,
                          size: 40,
                        ),),


                    IconButton(onPressed: (){},

                      icon: Icon(Icons.settings,
                        color: Colors.white,
                        size: 40,
                      ),),


                    IconButton(onPressed: (){},

                      icon: Icon(Icons.person,
                        color: Colors.white,
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