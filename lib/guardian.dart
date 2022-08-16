import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';


class Guardian extends StatefulWidget{
  @override
  _Guardian createState() => _Guardian();
}

class _Guardian extends  State<Guardian> {


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

                Text("Guardian",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),


                SizedBox(height: MediaQuery.of(context).size.height*0.02,),


                Container(
                  alignment: Alignment.topCenter,
                  height:450,
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

                          IconButton(onPressed: (){},
                            icon:Icon(Icons.close,
                              color:Colors.redAccent,
                              size: 30,),
                          ),
                        ],),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(60))
                            ),
                            //child: Image
                          ),
                        ],
                      ),

                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text("Oscar Harrison",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28.0,
                              fontWeight: FontWeight.w700,
                            ),),
                        ],),

                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),


                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            alignment: Alignment.centerLeft,
                            height: 60,
                            width: 280,
                            decoration: BoxDecoration(
                                color: Colors.lightBlue.shade100,

                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),

                            child:Row(mainAxisAlignment: MainAxisAlignment.start,

                              children: [
                                SizedBox(width: MediaQuery.of(context).size.width*0.01,),

                                Icon(Icons.phone_android,
                                  color:Colors.white,
                                  size:30,
                                ),

                                SizedBox(width: MediaQuery.of(context).size.width * 0.04,),

                                Text("0300-2412351",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),

                                ),

                              ],
                            ),

                          ),

                        ],),

                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),


                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            alignment: Alignment.centerLeft,
                            height: 60,
                            width: 280,
                            decoration: BoxDecoration(
                                color: Colors.lightBlue.shade100,

                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),

                            child:Row(mainAxisAlignment: MainAxisAlignment.start,

                              children: [
                                SizedBox(width: MediaQuery.of(context).size.width*0.01,),

                                Icon(Icons.people,
                                  color:Colors.white,
                                  size:30,
                                ),

                                SizedBox(width: MediaQuery.of(context).size.width * 0.04,),

                                Text("Husband",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),

                                ),

                              ],
                            ),

                          ),

                        ],),



                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),


                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            alignment: Alignment.centerLeft,
                            height: 60,
                            width: 280,
                            decoration: BoxDecoration(
                                color: Colors.lightBlue.shade100,

                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),

                            child:Row(mainAxisAlignment: MainAxisAlignment.start,

                              children: [
                                SizedBox(width: MediaQuery.of(context).size.width*0.01,),

                                Icon(Icons.email,
                                  color:Colors.white,
                                  size:30,
                                ),

                                SizedBox(width: MediaQuery.of(context).size.width * 0.04,),

                                Text("Oscar@gmail.com",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),

                                ),

                              ],
                            ),

                          ),

                        ],),

                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),


                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            alignment: Alignment.centerLeft,
                            height: 60,
                            width: 280,
                            decoration: BoxDecoration(
                                color: Colors.lightBlue.shade100,

                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),

                            child:Row(mainAxisAlignment: MainAxisAlignment.start,

                              children: [
                                SizedBox(width: MediaQuery.of(context).size.width*0.01,),

                                Icon(Icons.home,
                                  color:Colors.white,
                                  size:30,
                                ),

                                SizedBox(width: MediaQuery.of(context).size.width * 0.04,),

                                Text("585 Pugh Rd, Stockport",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),

                                ),

                              ],
                            ),

                          ),

                        ],),


                    ],
                  ),
                ),



                IconButton(onPressed: (){},

                  icon: Icon(Icons.arrow_back,
                    color: Colors.white,
                    size: 50,
                  ),),


                SizedBox(height: MediaQuery.of(context).size.height*0.02,),


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

                      icon: Icon(Icons.shield,
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