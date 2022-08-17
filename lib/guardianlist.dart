import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';
import 'guardian.dart';
import 'homeuser.dart';
import 'settings.dart';
import 'profileuser.dart';

class GuardianList extends StatefulWidget{
  @override
  _GuardianList createState() => _GuardianList();
}

class _GuardianList extends  State<GuardianList> {


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


                SizedBox(height: MediaQuery.of(context).size.height*0.08,),

                Container(
                  alignment: Alignment.topCenter,
                  height: 100,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),


                  child:Column(mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Text("Oscar Harrison  ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28.0,
                              fontWeight: FontWeight.w700,
                            ),),

                          SizedBox(width: MediaQuery.of(context).size.width*0.02,),

                          IconButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Guardian()));
                          },
                            icon:Icon(Icons.edit,
                              color:Colors.blueAccent,
                              size: 20,),
                          ),
                        ],),



                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text("0300-2412351",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFA2A0A0),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400,
                            ),),

                        ],),

                    ],
                  ),
                ),



                SizedBox(height: MediaQuery.of(context).size.height*0.02,),



        Container(
          alignment: Alignment.topCenter,
          height: 100,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),


          child:Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Text("Emilia Robinson",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                    ),),

                  SizedBox(width: MediaQuery.of(context).size.width*0.02,),

                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Guardian()));
                  },
                    icon:Icon(Icons.edit,
                      color:Colors.blueAccent,
                      size: 20,),
                  ),
                ],),



              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("0321-4562719",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA2A0A0),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),),

                ],),

            ],
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



                SizedBox(height: MediaQuery.of(context).size.height*0.06,),


                IconButton(onPressed: (){
                  Navigator.pop(context);
                },

                  icon: Icon(Icons.arrow_back,
                    color: Colors.white,
                    size: 50,
                  ),),


                SizedBox(height: MediaQuery.of(context).size.height*0.08,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeUser()));
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