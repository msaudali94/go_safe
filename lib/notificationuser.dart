import 'package:flutter/material.dart';
import 'package:go_safe/res/Assets.dart';
import 'profileuser.dart';
import 'homeuser.dart';

class NotificationUser extends StatefulWidget{
  @override
  _NotificationUser createState() => _NotificationUser();
}

class _NotificationUser extends  State<NotificationUser> {

  bool isSwitched = false;
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
            color: Colors.black54.withOpacity(0.9),

            child: Column(

              children: [

                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),

                Text("Settings",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.08,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Icon(Icons.notifications_none,
                      color: Colors.white,
                      size: 30,
                    ),

                    TextButton(onPressed: () {},
                      child: Text("Notifcation ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),),),
                  ],
                ),

                Divider(
                  thickness:0.8,
                  color: Color(0xFFA2A0A0),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    TextButton(onPressed: () {},
                      child: Text("App Notifications  ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),),),

                    SizedBox(width: MediaQuery.of(context).size.width * 0.16,),


                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      inactiveThumbColor: Color(0xFFA2A0A0),
                      inactiveTrackColor: Colors.white.withOpacity(0.8),

                      activeTrackColor: Colors.green,
                      activeColor: Colors.greenAccent,
                    ),



                  ],
                ),


                SizedBox(height: MediaQuery.of(context).size.height * 0.365,),

                IconButton(onPressed: (){
                  Navigator.pop(context);
                },

                  icon: Icon(Icons.arrow_back,
                    color: Colors.white,
                    size: 50,
                  ),),

                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),



                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeUser()));
                    },

                      icon: Icon(Icons.home,
                        color: Colors.white,
                        size: 40,
                      ),),


                    IconButton(onPressed: () {},

                      icon: Icon(Icons.settings,
                        color: Colors.blueAccent,
                        size: 40,
                      ),),


                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileUser()));
                    },

                      icon: Icon(Icons.person,
                        color: Colors.white,
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
