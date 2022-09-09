import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';
import 'homeuser.dart';
import 'settings.dart';

class ProfileUser extends StatefulWidget{
  const ProfileUser({Key? key}) : super(key: key);

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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(Assets.logo),
              fit: BoxFit.cover,
            ),        ),
          child:Container(
            padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.1 ),
            color: Colors.black54.withOpacity(0.9),

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


                const Text("Amanda Anderson",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),),

                SizedBox(height: MediaQuery.of(context).size.height*0.01),

                const Icon(Icons.edit, color: Colors.white,size: 25,),

                SizedBox(height: MediaQuery.of(context).size.height*0.02,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [


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
                  children: const [


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
                  children: const [


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
                  children: const [


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
                  children: const [


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
                  children: const [


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
                  children: const [


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
                  children: const [


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
                  children: const [


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
                  children: const [


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
                  children: const [


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
                  children: const [


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
                  children: const [


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
                  children: const [


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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeUser()));
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


                    IconButton(onPressed: (){},

                      icon: const Icon(Icons.person,
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