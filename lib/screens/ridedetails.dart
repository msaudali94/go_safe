import 'package:flutter/material.dart';
import 'homeguardian.dart';
import 'settingguardian.dart';
import 'profileguardian.dart';


class RideDetails extends StatefulWidget{
  const RideDetails({Key? key}) : super(key: key);

  @override
  _RideDetails createState() => _RideDetails();
}

class _RideDetails extends  State<RideDetails> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,


          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            color: Colors.black87,

            child: SingleChildScrollView(
              child: Column(

                children: [

                  SizedBox(height: MediaQuery.of(context).size.height * 0.64,),

                  const Text("Car Plate Number",
                    style: TextStyle(
                      color: Color(0xFFA2A0A0),
                      fontSize: 17.0,
                      fontWeight: FontWeight.w400,
                    ),),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.01,),

                  Container(
                    alignment: Alignment.center,
                      height: 80,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(50))
                      ),
                      child: const Text("STK-2145",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.w500,
                        ),),

                  ),


                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),

                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  },

                    icon: const Icon(Icons.arrow_back,
                      color: Colors.white,
                      size: 50,
                    ),),


                  SizedBox(height: MediaQuery.of(context).size.height * 0.02,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeGuardian()));
                      },

                        icon: const Icon(Icons.home,
                          color: Colors.white,
                          size: 40,
                        ),),


                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsGuardian()));
                      },

                        icon: const Icon(Icons.settings,
                          color: Colors.white,
                          size: 40,
                        ),),


                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileGuardian()));
                      },

                        icon: const Icon(Icons.person,
                          color: Colors.white,
                          size: 40,
                        ),),


                      IconButton(onPressed: (){},

                        icon: const Icon(Icons.local_taxi,
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
