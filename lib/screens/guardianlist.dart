
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';
import 'package:go_safe/screens/homeuser.dart';
import 'package:go_safe/screens/profileuser.dart';
import 'package:go_safe/screens/settings.dart';

class GuardianList extends StatefulWidget{
  @override
  _GuardianList createState() => _GuardianList();
}

class _GuardianList extends  State<GuardianList> {
  // CollectionReference users = FirebaseFirestore.instance.collection('Guardian1');


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

            child: SingleChildScrollView(
              // child: GetUserName("${FirebaseAuth.instance.currentUser?.email}"),
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
                  GetUserName("${FirebaseAuth.instance.currentUser?.email}","Guardian1"),

                  // Container(
                  //   alignment: Alignment.topCenter,
                  //   height: 100,
                  //   width: 400,
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       border: Border.all(
                  //         color: Colors.white,
                  //         width: 3,
                  //       ),
                  //       borderRadius: BorderRadius.all(Radius.circular(10))
                  //   ),
                  //
                  //
                  //   child:Column(mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //
                  //       Row(mainAxisAlignment: MainAxisAlignment.end,
                  //         children: [
                  //
                  //           Text("Oscar Harrison  ",
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(
                  //               color: Colors.black,
                  //               fontSize: 28.0,
                  //               fontWeight: FontWeight.w700,
                  //             ),),
                  //
                  //           SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                  //
                  //           // IconButton(onPressed: (){
                  //           //   FirebaseFirestore.instance
                  //           //       .collection('data')
                  //           //       .add({'text': 'data added through app'});
                  //           //   Navigator.push(context, MaterialPageRoute(builder: (context) => Guardian()));
                  //           // },
                  //           //   icon:Icon(Icons.edit,
                  //           //     color:Colors.blueAccent,
                  //           //     size: 20,),
                  //           // ),
                  //         ],),
                  //
                  //
                  //
                  //       Row(mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //
                  //           Text("0300-2412351",
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(
                  //               color: Color(0xFFA2A0A0),
                  //               fontSize: 20.0,
                  //               fontWeight: FontWeight.w400,
                  //             ),),
                  //
                  //         ],),
                  //
                  //     ],
                  //   ),
                  // ),



                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  GetUserName("${FirebaseAuth.instance.currentUser?.email}","Guardian2"),



        //           Container(
        //   alignment: Alignment.topCenter,
        //   height: 100,
        //   width: 400,
        //   decoration: BoxDecoration(
        //         color: Colors.white,
        //         border: Border.all(
        //           color: Colors.white,
        //           width: 3,
        //         ),
        //         borderRadius: BorderRadius.all(Radius.circular(10))
        //   ),
        //
        //
        //   child:Column(mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //
        //         Row(mainAxisAlignment: MainAxisAlignment.end,
        //           children: [
        //
        //             Text("Emilia Robinson",
        //               textAlign: TextAlign.center,
        //               style: TextStyle(
        //                 color: Colors.black,
        //                 fontSize: 28.0,
        //                 fontWeight: FontWeight.w700,
        //               ),),
        //
        //             SizedBox(width: MediaQuery.of(context).size.width*0.02,),
        //
        //             // IconButton(onPressed: (){
        //             //   Navigator.push(context, MaterialPageRoute(builder: (context) => Guardian()));
        //             // },
        //             //   icon:Icon(Icons.edit,
        //             //     color:Colors.blueAccent,
        //             //     size: 20,),
        //             // ),
        //           ],),
        //
        //
        //
        //         Row(mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //
        //             Text("0321-4562719",
        //               textAlign: TextAlign.center,
        //               style: TextStyle(
        //                 color: Color(0xFFA2A0A0),
        //                 fontSize: 20.0,
        //                 fontWeight: FontWeight.w400,
        //               ),),
        //
        //           ],),
        //
        //       ],
        //   ),
        // ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),

                  //  Container(
                  //     height: 55,
                  //     width: 55,
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         border: Border.all(
                  //           color: Colors.white,
                  //           width: 3,
                  //         ),
                  //         borderRadius: BorderRadius.all(Radius.circular(120))
                  //     ),
                  //     child: IconButton(onPressed: (){},
                  //       icon: Icon(Icons.add,
                  //         color: Colors.blueAccent,
                  //         size: 32,
                  //       ),)
                  //
                  // ),



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

                        icon: Icon(Icons.view_list,
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

class GetUserName extends StatelessWidget {
  final String documentId;
  final String collectionId;

  GetUserName(this.documentId, this.collectionId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection(collectionId);

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Container(
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text("${data['name']}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700,
                      ),),

                    SizedBox(width: MediaQuery.of(context).size.width*0.02,),

                    // IconButton(onPressed: (){
                    //   FirebaseFirestore.instance
                    //       .collection('data')
                    //       .add({'text': 'data added through app'});
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => Guardian()));
                    // },
                    //   icon:Icon(Icons.edit,
                    //     color:Colors.blueAccent,
                    //     size: 20,),
                    // ),
                  ],),



                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text("${data['number']}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFA2A0A0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),),

                  ],),

              ],
            ),
          );

          // return Text("name: ${data['name']} ${data['number']}", style: TextStyle(color: Colors.amber),);
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}