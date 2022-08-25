import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';
import 'package:go_safe/screens/homeuser.dart';
import 'package:go_safe/screens/profileuser.dart';
import 'package:go_safe/screens/settings.dart';

class Sos extends StatefulWidget{
  const Sos({Key? key}) : super(key: key);

  @override
  _Sos createState() => _Sos();
}

class _Sos extends  State<Sos> {

  @override
  void initState() {
    // ZegoExpressEngine.instance.startPlayingStream(streamID);

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
            color: Colors.redAccent.withOpacity(0.96),

            child: Column(

              children: [

                SizedBox(height: MediaQuery.of(context).size.height*0.2,),


                const Text("An alarm has been sent to the guardians ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                  ),),




                SizedBox(height: MediaQuery.of(context).size.height*0.12,),

                Container(
                  height: 220,
                  width: 220,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(120))
                  ),
                  child: Icon(Icons.notifications_active,
                    color: Colors.black.withOpacity(0.6),
                    size: 150,
                  ),

                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.12,),

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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeUser()));
                    },

                      icon: const Icon(Icons.home,
                        color: Colors.white,
                        size: 40,
                      ),),


                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserSettings()));
                    },

                      icon: const Icon(Icons.settings,
                        color: Colors.white,
                        size: 40,
                      ),),


                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileUser()));
                    },

                      icon: const Icon(Icons.person,
                        color: Colors.white,
                        size: 40,
                      ),),


                    IconButton(onPressed: (){},

                      icon: const Icon(Icons.notifications,
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