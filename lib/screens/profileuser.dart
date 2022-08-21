import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';
import 'homeuser.dart';
import 'settings.dart';

class ProfileUser extends StatefulWidget{
  @override
  _ProfileUser createState() => _ProfileUser();
}

class _ProfileUser extends  State<ProfileUser> {


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


                Text("Amanda Anderson",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),),

                SizedBox(height: MediaQuery.of(context).size.height*0.01),

                Icon(Icons.edit, color: Colors.white,size: 25,),

                SizedBox(height: MediaQuery.of(context).size.height*0.02,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                     Text("Username ",
                      style: TextStyle(
                        color: Color(0xFFA2A0A0),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                      ),),

                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Text("Amanda001 ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),),
                  ],
                ),



                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Text("Full name ",
                      style: TextStyle(
                        color: Color(0xFFA2A0A0),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                      ),),

                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Text("Amanda Anderson ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),),
                  ],
                ),



                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Text("Email ",
                      style: TextStyle(
                        color: Color(0xFFA2A0A0),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                      ),),

                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Text("Amanda@gmail.com ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),),
                  ],
                ),



                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Text("Phone ",
                      style: TextStyle(
                        color: Color(0xFFA2A0A0),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                      ),),

                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Text("+923030467891",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),),
                  ],
                ),



                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Text("Gender ",
                      style: TextStyle(
                        color: Color(0xFFA2A0A0),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                      ),),

                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Text("Female",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),),
                  ],
                ),



                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Text("Date of birth ",
                      style: TextStyle(
                        color: Color(0xFFA2A0A0),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                      ),),

                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Text("21/10/1994 ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),),
                  ],
                ),



                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Text("Address ",
                      style: TextStyle(
                        color: Color(0xFFA2A0A0),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                      ),),

                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Text("585 Pugh Rd Stockport, Ohio(OH)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),),
                  ],
                ),


                SizedBox(height: MediaQuery.of(context).size.height * 0.11,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeUser()));
                    },

                      icon: Icon(Icons.home,
                        color: Colors.white,
                        size: 40,
                      ),),


                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserSettings()));
                    },

                      icon: Icon(Icons.settings,
                        color: Colors.white,
                        size: 40,
                      ),),


                    IconButton(onPressed: (){},

                      icon: Icon(Icons.person,
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