import 'package:flutter/material.dart';
import 'package:go_safe/screens/homeguardian.dart';
import 'package:go_safe/screens/profileguardian.dart';
import 'package:go_safe/screens/settingguardian.dart';


class LiveLocation extends StatefulWidget{
  const LiveLocation({Key? key}) : super(key: key);

  @override
  _LiveLocation createState() => _LiveLocation();
}

class _LiveLocation extends  State<LiveLocation> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,


          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            color: Colors.black87,

            child: Column(

              children: [

                SizedBox(height: MediaQuery.of(context).size.height * 0.62,),


        const Text("Location",
          style: TextStyle(
            color: Color(0xFFA2A0A0),
            fontSize: 17.0,
            fontWeight: FontWeight.w400,
          ),),

        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),

        Container(
          alignment: Alignment.centerLeft,
          height: 70,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))
          ),

          child:Row(mainAxisAlignment: MainAxisAlignment.start,

            children: [

              const Icon(Icons.radio_button_checked,
              color:Colors.redAccent,
              size:40,
              ),

              SizedBox(width: MediaQuery.of(context).size.width * 0.02,),

              const Text("258  Patten Street",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),

              ),

            ],
          ),

        ),


                SizedBox(height: MediaQuery.of(context).size.height*0.04,),

                IconButton(onPressed: (){
                  Navigator.pop(context);
                },

                  icon: const Icon(Icons.arrow_back,
                    color: Colors.white,
                    size: 50,
                  ),),


                SizedBox(height: MediaQuery.of(context).size.height * 0.06,),


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

                      icon: const Icon(Icons.location_on_sharp,
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
