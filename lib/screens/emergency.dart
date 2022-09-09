import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';
import 'package:go_safe/screens/batterystatus.dart';
import 'package:go_safe/screens/homeguardian.dart';
import 'package:go_safe/screens/livelocation.dart';
import 'package:go_safe/screens/profileguardian.dart';
import 'package:go_safe/screens/settingguardian.dart';
import 'package:url_launcher/url_launcher.dart';


class Emergency extends StatefulWidget{
  const Emergency({Key? key}) : super(key: key);

  @override
  _Emergency createState() => _Emergency();
}

class _Emergency extends  State<Emergency> {


  @override
  void initState() {
    // ZegoUser user = ZegoUser('abcd', 'ab@gmail.com');
    //
    //
    // ZegoRoomConfig config = ZegoRoomConfig.defaultConfig();
    //
    // config.token = "04AAAAAGMYehMAEGJxdm1sdjg3NXUxbGxleDcAoEsYHy6MemgZZl34bzczvuikjxZvtu+iv8s7WwRe9FMzpA7lvSSzDmaAa1z4/n0pMchwxOS04Z0ME8YtNx32fM4aN2wF8iiLrwRWebHoJuAypUqLEupwPsWK2hyv9pTwJcfxwoDZQZhIJM4695P1ajg1qqtHzCmoG+V5DFLfaXUAkR9L7tIrsFdPkFcRf9kJV8HonBSZSXYyrO09zS4yMfY=";
    //
    // ZegoExpressEngine.instance.loginRoom('room1', user, config: config);
    super.initState();
  }


  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(Assets.logo),
              fit: BoxFit.cover,
            ),        ),
          child:Container(
            padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.1 ),
            color: Colors.black54.withOpacity(0.9),

            child: SingleChildScrollView(
              child: Column(

                children: [

                  SizedBox(height: MediaQuery.of(context).size.height*0.08,),


                  const Icon(Icons.warning,
                    color: Colors.white,
                    size: 80,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  const Text("Emergency",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),


                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Background color
                            minimumSize: const Size(100, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            )
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LiveLocation()));
                        },

                        child: const Icon(Icons.location_on,
                          color: Colors.redAccent,
                          size: 50,
                        ),
                      ),



                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Background color
                            minimumSize: const Size(100, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            )
                        ),
                        onPressed: () {
                          // ZegoExpressEngine.instance.startPlayingStream("streamID").whenComplete(() async {
                          //   await Future.delayed(const Duration(minutes: 1), () {
                          //     ZegoExpressEngine.instance.stopPublishingStream();
                          //     ZegoExpressEngine.instance.stopPlayingStream("streamID");
                          //     ZegoExpressEngine.instance.logoutRoom('room1');
                          //   });
                          // });
                        },

                        child: const Icon(Icons.volume_up,
                          color: Colors.redAccent,
                          size: 50,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [

                      Text("View Location",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),),

                      Text("Listen Audio",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),),

                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Background color
                            minimumSize: const Size(100, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            )
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BatteryStatus()));
                        },

                        child: const Icon(Icons.battery_3_bar_sharp,
                          color: Colors.redAccent,
                          size: 50,
                        ),
                      ),



                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Background color
                            minimumSize: const Size(100, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            )
                        ),
                        onPressed: () {
                          launchPhoneDialer("03244672123") ;
                          },

                        child: const Icon(Icons.call,
                          color: Colors.redAccent,
                          size: 50,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [

                      Text("Battery",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),),

                      Text("Call ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),),

                    ],
                  ),





                  SizedBox(height: MediaQuery.of(context).size.height*0.2,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomeGuardian()));
                      },

                        icon: const Icon(Icons.home,
                          color: Colors.white,
                          size: 40,
                        ),),


                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>const SettingsGuardian()));
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

                        icon: const Icon(Icons.warning,
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
  Future<void> launchPhoneDialer(String contactNumber) async {
    final Uri _phoneUri = Uri(
        scheme: "tel",
        path: contactNumber
    );
    try {
      if (await canLaunch(_phoneUri.toString()))
        await launch(_phoneUri.toString());
    } catch (error) {
      throw("Cannot dial");
    }
  }
}