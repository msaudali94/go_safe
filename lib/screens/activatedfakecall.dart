import 'package:flutter/material.dart';
import 'fakecalltwo.dart';
import 'homeuser.dart';


class FakeCallOne extends StatefulWidget{
  @override
  _FakeCallOne createState() => _FakeCallOne();
}

class _FakeCallOne extends  State<FakeCallOne> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,


          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            color: Colors.black87,

            child: Column(

              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.18,),

                Text("Mother",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),


                SizedBox(height: MediaQuery.of(context).size.height * 0.38,),



                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Icon(Icons.alarm,
                      color: Colors.white,
                      size: 40,),


                    Icon(Icons.message,
                      color: Colors.white,
                      size: 40,),

                  ],
                ),


                SizedBox(height: MediaQuery.of(context).size.height * 0.01,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Text("Remind Me  ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),),

                    Text("Message",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),),

                  ],
                ),



                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),




                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [

                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                        border: Border.all(
                          color: Colors.redAccent,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(120))
                    ),
                    child:IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeUser()));
                    },

                        icon: Icon(Icons.call_end,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),),





                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          border: Border.all(
                            color: Colors.greenAccent,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(120))
                      ),
                      child:   IconButton(onPressed: (){

                        Navigator.push(context, MaterialPageRoute(builder: (context) => FakeCallTwo()));

                        },
                        icon: Icon(Icons.call,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),


                    ),

                  ]
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Text("Decline  ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),),

                    Text("Accept",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
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
