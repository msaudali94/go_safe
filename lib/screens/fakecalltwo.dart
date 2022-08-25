import 'package:flutter/material.dart';
import 'package:go_safe/screens/homeuser.dart';


class FakeCallTwo extends StatefulWidget{
  const FakeCallTwo({Key? key}) : super(key: key);

  @override
  _FakeCallTwo createState() => _FakeCallTwo();
}

class _FakeCallTwo extends  State<FakeCallTwo> {

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
                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),

                const Icon(Icons.person,
                  color: Colors.white,
                  size: 80,
                ),


                const Text("Mother",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                const Text("00:13",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.5,),





                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [

                      const Icon(Icons.volume_up,
                      color:Colors.white,
                      size: 40,),


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

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeUser()
                                ),
                                    (Route<dynamic> route) => false);

                            },
                            icon: const Icon(Icons.call_end, color: Colors.white, size: 50,),),


                      ),



                      const Icon(Icons.keyboard_alt_sharp,
                        color:Colors.white,
                        size: 40,),


                    ]
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [

                    Text("  Decline  ",
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
