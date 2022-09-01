import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';
import 'package:go_safe/screens/homeguardian.dart';
import 'package:go_safe/screens/profileguardian.dart';
import 'package:go_safe/screens/settingguardian.dart';


class BatteryStatus extends StatefulWidget{
  const BatteryStatus({Key? key}) : super(key: key);

  @override
  _BatteryStatus createState() => _BatteryStatus();
}

class _BatteryStatus extends  State<BatteryStatus> {
  String batteryLevel="";


  @override
  void initState() {
    getBatteryStatus();
    super.initState();
  }


  getBatteryStatus()
  async {
      final ref = await FirebaseFirestore.instance
          .collection('UserBattery')
          .doc("ab@gmail.com")
          .get();
      if (ref.exists) {
        print("ref.reference${ref.get("battery_level")}");
        batteryLevel = "${ref.get("battery_level")}";
      } else {
        print('No data available.');
      }
      setState(() {

      });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(Assets.logo),
            fit: BoxFit.cover,
          ),),

          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            color: Colors.black87,

            child: Column(

              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.14,),


                const Text("Battery",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.22),


                    const Icon(Icons.battery_3_bar_sharp,
                      color: Colors.white,
                      size: 120,

                    ),





                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

                Text(batteryLevel==""?"25%":"$batteryLevel%",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),


                SizedBox(height: MediaQuery.of(context).size.height * 0.12,),

                IconButton(onPressed: (){
                  Navigator.pop(context);
                },

                  icon: const Icon(Icons.arrow_back,
                    color: Colors.white,
                    size: 50,
                  ),),




                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeGuardian()));
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

                  icon: const Icon(Icons.battery_3_bar_sharp,
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
