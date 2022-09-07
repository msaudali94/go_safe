import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/screens/homeguardian.dart';
import 'package:go_safe/screens/profileguardian.dart';
import 'package:go_safe/screens/settingguardian.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LiveLocation extends StatefulWidget {
  const LiveLocation({Key? key}) : super(key: key);

  @override
  _LiveLocation createState() => _LiveLocation();
}

class _LiveLocation extends State<LiveLocation> {
  LatLng? currentMarkerLatLng;
  GoogleMapController? controller;
  MarkerId? selectedMarker;
  LatLng? markerPosition;
  String locationName="";
  late double longitude=0.0;
  late double latitude=0.0;
  GoogleMapController? mapController; //contrller for Google map
  final Set<Marker> markers = new Set();
  // late LatLng ? showLocation;
  // LocationData? currentLocation;
  late LocationData destinationLocation;
  late Location location;
  // late StreamSubscription<LocationData> subscription;
  final key = GlobalKey();

  onMapCreated(GoogleMapController controller) {
    debugPrint("longitudemarkers $longitude, latitude $latitude");
    //method called when map is created
    setState(() {
      mapController = controller;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latitude,longitude),
          zoom: 15.89,
        ),
      ));
    });
  }
  
  Future<void> getUserLocation()
  async {
    final ref = await FirebaseFirestore.instance
        .collection('UserLocation')
        .doc("ab@gmail.com")
        .get();
    // final ref = FirebaseDatabase.instance.ref();
    // final snapshot = await ref.child('users/$userId').get();
    setState(() {
      if (ref.exists) {
        locationName = "${ref.get("locationName")}";
        longitude=double.parse("${ref.get("longitude")}");
        latitude=double.parse("${ref.get("latitude")}");
      } else {
        print('No data available.');
      }

      debugPrint("locationNameLatitude$latitude");

      // showLocation =  LatLng(latitude, longitude);
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // subscription = location.onLocationChanged.listen((clocation) {
      //   currentLocation = clocation;
      //   showLocation = LatLng(clocation.latitude!, clocation.longitude!);
      //   debugPrint("currentLocation$currentLocation");
      // });
      // location.onLocationChanged.listen((clocation) {
      //   // currentLocation = clocation;
      //   showLocation = LatLng(clocation.latitude!, clocation.longitude!);
      //   // debugPrint("currentLocation$currentLocation");
      // });
    });

  }

  @override
  void initState() {
    getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      zoom: 15.89,
      tilt: 40,
      bearing: 20,
      target: latitude != null
          ? LatLng(
              latitude,
              longitude,
            )
          : const LatLng(0.0, 0.0),
    );

    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            color: Colors.black87,

            child: Stack(
              children: [
                latitude==0.0?Center(child: CircularProgressIndicator(),):GoogleMap(
                  key: key,

                  //Map widget from google_maps_flutter package
                  // onTap: _handleTap,
                  myLocationEnabled: false,
                  zoomGesturesEnabled: true,
                  //enable Zoom in, out on map
                  initialCameraPosition: initialCameraPosition,
                  markers: getmarkers(),
                  //markers to show on map
                  mapType: MapType.normal,
                  //map type
                  onMapCreated: onMapCreated,
                ),

                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.6),
                  child: const Text(
                    "Location",
                    style: TextStyle(
                      color: Color(0xFFA2A0A0),
                      fontSize: 17.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                // SizedBox(height: MediaQuery.of(context).size.height * 0.01,),

                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.63),
                  child: Container(

                    alignment: Alignment.centerLeft,
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.radio_button_checked,
                          color: Colors.redAccent,
                          size: 40,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                         Text(
                           locationName==""?"258  Patten Street":locationName,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,

                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // SizedBox(height: MediaQuery.of(context).size.height*0.04,),

                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.75, left: MediaQuery.of(context).size.width * 0.4),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 50,
                    ),
                  ),
                ),

                // SizedBox(height: MediaQuery.of(context).size.height * 0.06,),

                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.85),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeGuardian()));
                        },
                        icon: const Icon(
                          Icons.home,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SettingsGuardian()));
                        },
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileGuardian()));
                        },
                        icon: const Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.location_on_sharp,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Set<Marker> getmarkers() { //markers to place on map
    setState(() {
      markers.add(Marker( //add first marker
        markerId: MarkerId(longitude.toString()),
        position: LatLng(latitude, longitude), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'User',
          snippet: "User's current location.",
        ),
        icon: BitmapDescriptor.defaultMarker,
        //Icon for Marker
      ));

      // markers.add(Marker( //add second marker
      //   markerId: MarkerId(showLocation.toString()),
      //   position: LatLng(27.7099116, 85.3132343), //position of marker
      //   infoWindow: InfoWindow( //popup info
      //     title: 'Marker Title Second ',
      //     snippet: 'My Custom Subtitle',
      //   ),
      //   icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      // ));

      // markers.add(Marker( //add third marker
      //   markerId: MarkerId(showLocation.toString()),
      //   position: LatLng(27.7137735, 85.315626), //position of marker
      //   infoWindow: InfoWindow( //popup info
      //     title: 'Marker Title Third ',
      //     snippet: 'My Custom Subtitle',
      //   ),
      //   icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      // ));

      //add more markers here
    });

    return markers;
  }

  // _handleTap(LatLng point) {
  //   setState(() {
  //     // currentMarkerLat =
  //     // currentMarkerLng =;
  //     currentMarkerLatLng = LatLng(point.latitude, point.longitude);
  //     markers.add(Marker(
  //       markerId: MarkerId(point.toString()),
  //       position: point,
  //       infoWindow: const InfoWindow(
  //         title: 'I am a marker',
  //       ),
  //       icon:
  //           BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
  //     ));
  //   });
  // }
}
