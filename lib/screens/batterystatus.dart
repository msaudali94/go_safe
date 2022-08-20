import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';
import 'package:go_safe/screens/profileguardian.dart';
import 'package:go_safe/screens/settingguardian.dart';

import 'homeguardian.dart';


class BatteryStatus extends StatefulWidget{
  @override
  _BatteryStatus createState() => _BatteryStatus();
}

class _BatteryStatus extends  State<BatteryStatus> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage(Assets.logo),
            fit: BoxFit.cover,
          ),),

          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            color: Colors.black87,

            child: Column(

              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.14,),


                Text("Battery",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.22),


                    Icon(Icons.battery_3_bar_sharp,
                      color: Colors.white,
                      size: 120,

                    ),





                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

                Text("25%",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),


                SizedBox(height: MediaQuery.of(context).size.height * 0.12,),

                IconButton(onPressed: (){
                  Navigator.pop(context);
                },

                  icon: Icon(Icons.arrow_back,
                    color: Colors.white,
                    size: 50,
                  ),),




                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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


                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileGuardian()));
                },

                  icon: Icon(Icons.person,
                    color: Colors.white,
                    size: 40,
                  ),),


                IconButton(onPressed: (){},

                  icon: Icon(Icons.battery_3_bar_sharp,
                    color: Colors.blueAccent,
                    size: 40,
                  ),),

              ],
            ),





        ],
      ),
    ),

      ),

    );
  }
}
