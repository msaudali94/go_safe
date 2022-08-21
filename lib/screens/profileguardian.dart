import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';
import 'homeguardian.dart';
import 'settingguardian.dart';

class ProfileGuardian extends StatefulWidget{
  @override
  _ProfileGuardian createState() => _ProfileGuardian();
}

class _ProfileGuardian extends  State<ProfileGuardian> {

  DateTime selectedDate = DateTime.now();

  bool isDateSelected = false;

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

                  Text("Oscar Harrison  ",
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


                      Text("Oscar123 ",
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


                  TextField(
                    decoration: new InputDecoration.collapsed(
                        hintText: 'Oscar Harrison',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        )
                    ),
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

                  TextField(
                    decoration: new InputDecoration.collapsed(
                        hintText: 'scar@gmail.com',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //
                  //
                  //     Text("oscar@gmail.com",
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 20.0,
                  //         fontWeight: FontWeight.w500,
                  //       ),),
                  //   ],
                  // ),



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

                  TextField(
                    decoration: new InputDecoration.collapsed(
                        hintText: '+923002412351',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //
                  //
                  //     Text("+923002412351",
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 20.0,
                  //         fontWeight: FontWeight.w500,
                  //       ),),
                  //   ],
                  // ),



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

                  TextField(
                    decoration: new InputDecoration.collapsed(
                        hintText: 'Male',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //
                  //
                  //     Text("Male",
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 20.0,
                  //         fontWeight: FontWeight.w500,
                  //       ),),
                  //   ],
                  // ),



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

                  TextField(
                    onTap: (){
                      _selectDate(context);
                    },
                    readOnly: true,
                    decoration: new InputDecoration.collapsed(
                        hintText: isDateSelected
                            ? "${selectedDate.toLocal().day}-${selectedDate.toLocal().month}-${selectedDate.toLocal().year}"
                            :'11/05/1988',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //
                  //
                  //     Text("11/05/1988 ",
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 20.0,
                  //         fontWeight: FontWeight.w500,
                  //       ),),
                  //   ],
                  // ),



                  SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
            // _selectDate(context);


                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [


                      Text("Address",
                        style: TextStyle(
                          color: Color(0xFFA2A0A0),
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),),

                    ],
                  ),

                  TextField(
                    decoration: new InputDecoration.collapsed(
                        hintText: '585 Pugh Rd Stockport, Ohio(OH)',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //
                  //
                  //     Text("585 Pugh Rd Stockport, Ohio(OH)",
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 20.0,
                  //         fontWeight: FontWeight.w500,
                  //       ),),
                  //   ],
                  // ),


                  SizedBox(height: MediaQuery.of(context).size.height * 0.11,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeGuardian()));
                      },

                        icon: Icon(Icons.home,
                          color: Colors.white,
                          size: 40,
                        ),),


                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsGuardian()));
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
            ),

          )

      ),

    );
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        isDateSelected = true;
      });
    }
  }

}