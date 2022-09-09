import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:go_safe/screens/fakecalltwo.dart';
import 'package:go_safe/screens/homeuser.dart';


class FakeCallOne extends StatefulWidget{
  const FakeCallOne({Key? key}) : super(key: key);

  @override
  _FakeCallOne createState() => _FakeCallOne();
}

class _FakeCallOne extends  State<FakeCallOne> {

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
                SizedBox(height: MediaQuery.of(context).size.height * 0.18,),

                const Text("Mother",
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
                  children: const [

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
                  children: const [

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
                        borderRadius: const BorderRadius.all(Radius.circular(120))
                    ),
                    child:IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeUser()));
                    },

                        icon: const Icon(Icons.call_end,
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
                          borderRadius: const BorderRadius.all(Radius.circular(120))
                      ),
                      child:   IconButton(onPressed: (){
                        FlutterRingtonePlayer.play(
                          android: AndroidSounds.ringtone,
                          ios: IosSounds.glass,
                          looping: true, // Android only - API >= 28
                          volume: 0.9, // Android only - API >= 28
                          asAlarm: false, // Android only - all APIs
                        );

                        Navigator.push(context, MaterialPageRoute(builder: (context) => const FakeCallTwo()));

                        },
                        icon: const Icon(Icons.call,
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
                  children: const [

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
