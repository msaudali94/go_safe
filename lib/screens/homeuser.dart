import 'dart:async';
import 'package:battery_plus/battery_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:go_safe/res/Assets.dart';
import 'package:go_safe/screens/shareridedetails.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart'hide PermissionStatus;
import 'activatedfakecall.dart';
import 'generateguardianlist.dart';
import 'profileuser.dart';
import 'safemark.dart';
import 'settings.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({Key? key}) : super(key: key);

  @override
  _HomeUser createState() => _HomeUser();
}

class _HomeUser extends State<HomeUser> {
  // late StreamSubscription<LocationData> subscription;
  Location location = Location();
  LocationData? currentLocation;
  bool _serviceEnabled = false;
  PermissionStatus _permissionStatus = PermissionStatus.denied;
  var battery = Battery();

  @override
  void initState() {
    _listenForPermissionStatus();
    super.initState();
  }

  void _listenForPermissionStatus() async {
    // ZegoUser user = ZegoUser('abcd', 'ab@gmail.com');
    //
    //
    // ZegoRoomConfig config = ZegoRoomConfig.defaultConfig();
    //
    // config.token = "04AAAAAGMYehMAEGJxdm1sdjg3NXUxbGxleDcAoEsYHy6MemgZZl34bzczvuikjxZvtu+iv8s7WwRe9FMzpA7lvSSzDmaAa1z4/n0pMchwxOS04Z0ME8YtNx32fM4aN2wF8iiLrwRWebHoJuAypUqLEupwPsWK2hyv9pTwJcfxwoDZQZhIJM4695P1ajg1qqtHzCmoG+V5DFLfaXUAkR9L7tIrsFdPkFcRf9kJV8HonBSZSXYyrO09zS4yMfY=";
    //
    // ZegoExpressEngine.instance.loginRoom('room1', user, config: config);
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionStatus = await location.hasPermission();
    if (_permissionStatus == PermissionStatus.denied) {
      _permissionStatus = await location.requestPermission();
      if (_permissionStatus != PermissionStatus.granted) {
        location.getLocation();
        return;
      }
    }

    if(await Permission.sms.isGranted ==false)
      {
        await Permission.sms.request();
      }if(await Permission.phone.isGranted ==false)
      {
        await Permission.phone.request();
      }if(await Permission.microphone.isGranted ==false)
      {
        await Permission.microphone.request();
      }if(await Permission.storage.isGranted ==false)
      {
        await Permission.storage.request();
      }

    currentLocation = await location.getLocation();
    setState(() {});
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
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1),
            color: Colors.black54.withOpacity(0.9),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.1,
                    width: MediaQuery.of(context).size.height*0.1,

                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius:  BorderRadius.all(Radius.circular(MediaQuery.of(context).size.height*0.08))
                    ),
                    child: Icon(Icons.person, size: MediaQuery.of(context).size.height*0.08,),
                    //child: Image

                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Text(
                    "We are looking out for you ",
                    style: TextStyle(
                      color: Color(0xFFA2A0A0),
                      fontSize: 17.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Background color
                            minimumSize: const Size(100, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const GenerateGuardianList()));
                        },
                        child: Icon(
                          Icons.shield,
                          color: Colors.deepPurpleAccent.shade100,
                          size: 50,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Background color
                            minimumSize: const Size(100, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShareRideDetails()));
                        },
                        child: Icon(
                          Icons.local_taxi,
                          color: Colors.deepPurpleAccent.shade100,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "Guardian List ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Share Ride  ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Background color
                            minimumSize: const Size(100, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius:  BorderRadius.circular(35.0),
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SafeMark()));
                        },
                        child: Icon(
                          Icons.add_location_alt,
                          color: Colors.deepPurpleAccent.shade100,
                          size: 50,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Background color
                            minimumSize: const Size(100, 100),
                            shape:  RoundedRectangleBorder(
                              borderRadius:  BorderRadius.circular(35.0),
                            )),
                        onPressed: () {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FakeCallOne()));
                        },
                        child: Icon(
                          Icons.call,
                          color: Colors.deepPurpleAccent.shade100,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "Mark Safe  ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Fake Call ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(100))),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                            // Background color
                            minimumSize: const Size(80, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            )),
                        onPressed: () async {
                          GeoData data = await Geocoder2.getDataFromCoordinates(
                              latitude: currentLocation!.latitude!,
                              longitude: currentLocation!.longitude!,
                              googleMapApiKey: kGoogleApiKey);

                          await FirebaseFirestore.instance
                              .collection('UserLocation')
                              .doc("${FirebaseAuth.instance.currentUser?.email}")
                              .set({
                            "latitude": currentLocation?.latitude,
                            "longitude": currentLocation?.longitude,
                            "locationName":data.address
                          });
                          await FirebaseFirestore.instance
                              .collection('UserBattery')
                              .doc("${FirebaseAuth.instance.currentUser?.email}")
                              .set({
                            "battery_level": await battery.batteryLevel});
                          var documentList = (await FirebaseFirestore.instance
                              .collection("Users")
                              .where("role",isEqualTo: "Guardian")
                              .get());
                          print("documentList${documentList.docs.first.get("number")}");

                          String message = "Latitude: ${currentLocation?.latitude}, Longitude: ${currentLocation?.longitude}";
                          List<String> recipents = ["${documentList.docs.first.get("number")}"];
                          _sendSMS(recipents,message );
                          // ZegoExpressEngine.instance.startPublishingStream("streamID");
                          setState(() {

                          });





                          // ZegoUser user = ZegoUser.id('user1');
                          // ZegoExpressEngine.instance.startPublishingStream("streamID");
                          // ZegoExpressEngine.instance.startPlayingStream("streamID").whenComplete(() async {
                          //   await Future.delayed(const Duration(minutes: 1), () {
                          //     ZegoExpressEngine.instance.stopPublishingStream();
                          //     ZegoExpressEngine.instance.stopPlayingStream("streamID");
                          //     ZegoExpressEngine.instance.logoutRoom('room1');
                          //   });
                          // });
                        },
                        child: const Text(
                          "SOS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38.0,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.home,
                          color: Colors.blueAccent,
                          size: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserSettings()));
                        },
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileUser()));
                        },
                        icon: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
  Future<void> _sendSMS(List<String> recipients, String ?msg) async {
    try {
      String _result = await sendSMS(
        message: msg??"",
        recipients: recipients,
        sendDirect: true,
      );
      setState(() {
        print("_result $_result");
      });
    } catch (error) {

      setState(() {
        print("error $error");
      });
    }
  }
}
