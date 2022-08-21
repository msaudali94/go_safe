import 'package:flutter/material.dart';
import 'homeuser.dart';
import 'settings.dart';
import 'profileuser.dart';


class SafeMark extends StatefulWidget{
  @override
  _SafeMark createState() => _SafeMark();
}

class _SafeMark extends  State<SafeMark> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,


          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            color: Colors.black87,

            child: SingleChildScrollView(
              child: Column(

                children: [

                  SizedBox(height: MediaQuery.of(context).size.height * 0.6,),

                  TextFormField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder:OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.transparent),
                        borderRadius: BorderRadius.circular(5.5),),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.transparent),
                        borderRadius: BorderRadius.circular(5.5),),



                      hintText: "Search a place",
                      hintStyle: TextStyle(
                        color: Color(0xFFA2A0A0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.04,),


                  Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

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

                            icon: Icon(Icons.cancel_outlined,
                              color: Colors.redAccent,
                              size: 32,
                            ),)

                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent, // Background color
                          minimumSize: const Size(150, 60),

                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {},

                        child: Text("Search",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

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
                            icon: Icon(Icons.check_circle_outline,
                              color: Colors.greenAccent,
                              size: 32,
                            ),)

                      ),
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  },

                    icon: Icon(Icons.arrow_back,
                      color: Colors.white,
                      size: 50,
                    ),),


                  SizedBox(height: MediaQuery.of(context).size.height * 0.04,),


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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UserSettings()));
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

                        icon: Icon(Icons.location_on_sharp,
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
}
