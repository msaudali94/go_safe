import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';


class GenerateGuardianList extends StatefulWidget{
  @override
  _GenerateGuardianList createState() => _GenerateGuardianList();
}

class _GenerateGuardianList extends  State<GenerateGuardianList> {


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

                Icon(Icons.shield,
                  color: Colors.white,
                  size: 80,
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                Text("Guardian List",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.1,),


                Text("Enter the phone number    ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),),

                SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),),

                    hintText: "0300-7628401",
                    hintStyle: TextStyle(
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
                      borderRadius: BorderRadius.all(Radius.circular(120))
                  ),
                  child: IconButton(onPressed: (){},
                   icon: Icon(Icons.add,
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
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(35.0),
                          )
                      ),
                      onPressed: () {},

                      child: Icon(Icons.contacts  ,
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

                      child: Icon(Icons.view_list  ,
                        color: Colors.deepPurpleAccent.shade100,
                        size: 50,
                      ),
                    ),

                  ],
                ),



                SizedBox(height: MediaQuery.of(context).size.height*0.01),

        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [


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


                IconButton(onPressed: (){},

                  icon: Icon(Icons.arrow_back,
                    color: Colors.white,
                    size: 50,
                  ),),


                SizedBox(height: MediaQuery.of(context).size.height*0.04,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    IconButton(onPressed: (){},

                      icon: Icon(Icons.home,
                        color: Colors.white,
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

                    IconButton(onPressed: (){},

                      icon: Icon(Icons.view_list,
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