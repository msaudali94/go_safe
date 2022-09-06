import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'homeguardian.dart';
import 'settingguardian.dart';
import 'profileguardian.dart';


class RideDetails extends StatefulWidget{
  const RideDetails({Key? key}) : super(key: key);

  @override
  _RideDetails createState() => _RideDetails();
}

class _RideDetails extends  State<RideDetails> {
  final key = GlobalKey();
  // String kGoogleApiKey = "AIzaSyCqGcDZJekuh5y-pUiXZGyWoHEQOZQOe4Q";
  LatLng? currentMarkerLatLng;
  GoogleMapController? controller;
  MarkerId? selectedMarker;
  LatLng? markerPosition;
  String locationName="";
  late double longitude;
  late double latitude=0.0;
  GoogleMapController? mapController; //contrller for Google map
  final Set<Marker> markers = new Set();
  // late LatLng ? showLocation;
  // LocationData? currentLocation;
  late LocationData destinationLocation;
  late Location location;
  // late StreamSubscription<LocationData> subscription;

  onMapCreated(GoogleMapController controller) {
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
        .collection('UserPlateNumber')
        .doc("ab@gmail.com")
        .get();
    // final ref = FirebaseDatabase.instance.ref();
    // final snapshot = await ref.child('users/$userId').get();
    if (ref.exists) {
      locationName = "${ref.get("PlateNumber")}";
      longitude=double.parse("${ref.get("longitude")}");
      latitude=double.parse("${ref.get("latitude")}");
    } else {
      print('No data available.');
    }
    setState(() {
      debugPrint("locationNameLatitude$latitude");

      // showLocation =  LatLng(latitude, longitude);
    });
  }

  @override
  void initState() {
    longitude=35.213212;
    latitude=73.233112;
    getUserLocation();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      location = Location();
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      zoom: 15.89,
      tilt: 40,
      bearing: 20,
      target: latitude == 0.0
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
                GoogleMap(
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
                         top: MediaQuery.of(context).size.height * 0.63, left: MediaQuery.of(context).size.width * 0.26),
                     child: SizedBox(
                       height: MediaQuery.of(context).size.height*0.2,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           const Text("Car Plate Number",
                             style: TextStyle(
                               color: Color(0xFFA2A0A0),
                               fontSize: 17.0,
                               fontWeight: FontWeight.w400,
                             ),),

                           SizedBox(height: MediaQuery.of(context).size.height * 0.01,),

                           Container(
                             alignment: Alignment.center,
                             height: 80,
                             width: 200,
                             decoration: BoxDecoration(
                                 color: Colors.white,
                                 border: Border.all(
                                   color: Colors.white,
                                   width: 3,
                                 ),
                                 borderRadius: const BorderRadius.all(Radius.circular(50))
                             ),
                             child:  Text(locationName,
                               textAlign: TextAlign.center,
                               style: const TextStyle(
                                 color: Colors.black,
                                 fontSize: 28.0,
                                 fontWeight: FontWeight.w500,
                               ),),

                           ),
                         ],
                       ),
                     ),
                   )
                // Padding(
                //   padding: EdgeInsets.only(
                //       top: MediaQuery.of(context).size.height * 0.6),
                //   child: const Text(
                //     "Location",
                //     style: TextStyle(
                //       color: Color(0xFFA2A0A0),
                //       fontSize: 17.0,
                //       fontWeight: FontWeight.w400,
                //     ),
                //   ),
                // ),
                //
                //
                // Padding(
                //   padding: EdgeInsets.only(
                //       top: MediaQuery.of(context).size.height * 0.63),
                //   child: Container(
                //
                //     alignment: Alignment.centerLeft,
                //     height: 70,
                //     width: MediaQuery.of(context).size.width,
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         border: Border.all(
                //           color: Colors.white,
                //           width: 3,
                //         ),
                //         borderRadius:
                //         const BorderRadius.all(Radius.circular(10))),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         const Icon(
                //           Icons.radio_button_checked,
                //           color: Colors.redAccent,
                //           size: 40,
                //         ),
                //         SizedBox(
                //           width: MediaQuery.of(context).size.width * 0.02,
                //         ),
                //         Text(
                //           locationName==""?"258  Patten Street":locationName,
                //           textAlign: TextAlign.center,
                //           softWrap: true,
                //           style: TextStyle(
                //             overflow: TextOverflow.ellipsis,
                //
                //             color: Colors.black,
                //             fontSize: 14.0,
                //             fontWeight: FontWeight.normal,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                // SizedBox(height: MediaQuery.of(context).size.height*0.04,),

                , Padding(
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
                                  builder: (context) => const HomeGuardian()));
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
        infoWindow: const InfoWindow( //popup info
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

  // @override
  // Widget build(BuildContext context) {
  //
  //   return Scaffold(
  //     body: SizedBox(
  //         height: MediaQuery.of(context).size.height,
  //         width: MediaQuery.of(context).size.width,
  //
  //
  //         child: Container(
  //           padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
  //           color: Colors.black87,
  //
  //           child: SingleChildScrollView(
  //             child: Column(
  //
  //               children: [
  //
  //                 SizedBox(height: MediaQuery.of(context).size.height * 0.64,),
  //
  //                 const Text("Car Plate Number",
  //                   style: TextStyle(
  //                     color: Color(0xFFA2A0A0),
  //                     fontSize: 17.0,
  //                     fontWeight: FontWeight.w400,
  //                   ),),
  //
  //                 SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
  //
  //                 Container(
  //                   alignment: Alignment.center,
  //                     height: 80,
  //                     width: 200,
  //                     decoration: BoxDecoration(
  //                         color: Colors.white,
  //                         border: Border.all(
  //                           color: Colors.white,
  //                           width: 3,
  //                         ),
  //                         borderRadius: const BorderRadius.all(Radius.circular(50))
  //                     ),
  //                     child: const Text("STK-2145",
  //                       textAlign: TextAlign.center,
  //                       style: TextStyle(
  //                         color: Colors.black,
  //                         fontSize: 28.0,
  //                         fontWeight: FontWeight.w500,
  //                       ),),
  //
  //                 ),
  //
  //
  //                 SizedBox(height: MediaQuery.of(context).size.height*0.04,),
  //
  //                 IconButton(onPressed: (){
  //                   Navigator.pop(context);
  //                 },
  //
  //                   icon: const Icon(Icons.arrow_back,
  //                     color: Colors.white,
  //                     size: 50,
  //                   ),),
  //
  //
  //                 SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
  //
  //
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //
  //                     IconButton(onPressed: (){
  //                       Navigator.push(context, MaterialPageRoute(builder: (context) => HomeGuardian()));
  //                     },
  //
  //                       icon: const Icon(Icons.home,
  //                         color: Colors.white,
  //                         size: 40,
  //                       ),),
  //
  //
  //                     IconButton(onPressed: (){
  //                       Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsGuardian()));
  //                     },
  //
  //                       icon: const Icon(Icons.settings,
  //                         color: Colors.white,
  //                         size: 40,
  //                       ),),
  //
  //
  //                     IconButton(onPressed: (){
  //                       Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileGuardian()));
  //                     },
  //
  //                       icon: const Icon(Icons.person,
  //                         color: Colors.white,
  //                         size: 40,
  //                       ),),
  //
  //
  //                     IconButton(onPressed: (){},
  //
  //                       icon: const Icon(Icons.local_taxi,
  //                         color: Colors.blueAccent,
  //                         size: 40,
  //                       ),),
  //
  //                   ],
  //                 ),
  //
  //
  //
  //
  //
  //               ],
  //             ),
  //           ),
  //
  //         )
  //
  //     ),
  //
  //   );
  // }
}
