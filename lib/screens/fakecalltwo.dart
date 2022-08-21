import 'package:flutter/material.dart';
import 'homeuser.dart';


class FakeCallTwo extends StatefulWidget{
  @override
  _FakeCallTwo createState() => _FakeCallTwo();
}

class _FakeCallTwo extends  State<FakeCallTwo> {

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
                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),

                Icon(Icons.person,
                  color: Colors.white,
                  size: 80,
                ),


                Text("Mother",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                Text("00:13",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.5,),





                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [

                      Icon(Icons.volume_up,
                      color:Colors.white,
                      size: 40,),


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

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeUser()
                                ),
                                    (Route<dynamic> route) => false);

                            },
                            icon: Icon(Icons.call_end, color: Colors.white, size: 50,),),


                      ),



                      Icon(Icons.keyboard_alt_sharp,
                        color:Colors.white,
                        size: 40,),


                    ]
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Text("  Decline  ",
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
