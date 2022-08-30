import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/res/toasts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'homeuser.dart';
import 'settings.dart';
import 'profileuser.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SafeMark extends StatefulWidget{
  const SafeMark({Key? key}) : super(key: key);

  @override
  _SafeMark createState() => _SafeMark();
}

class _SafeMark extends  State<SafeMark> {
  GoogleMapController? controller;
  MarkerId? selectedMarker;
  LatLng? markerPosition;
  GoogleMapController? mapController; //contrller for Google map
  final Set<Marker> markers = {}; //markers for google map
  static LatLng showLocation = const LatLng(27.7089427, 85.3086209);
  LocationData ?currentLocation;
  late LocationData destinationLocation;
  late Location location;
  // void _onMapCreated(GoogleMapController controller) {
  //   this.controller = controller;
  // }
  late StreamSubscription<LocationData> subscription;
  double ?currentMarkerLat;
  double ?currentMarkerLng;
  LatLng? currentMarkerLatLng;
  int marker=1;





  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      location = Location();
      subscription =
          location.onLocationChanged.listen((clocation) {
            currentLocation = clocation;
            showLocation = LatLng(clocation.latitude!, clocation.longitude!);
            debugPrint("currentLocation$currentLocation");
          });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      zoom: 15.89,
      tilt: 40,
      bearing: 20,
      target: currentLocation != null
          ? LatLng(currentLocation?.latitude ?? 0.0,
        currentLocation?.longitude ?? 0.0,)
          : const LatLng(0.0, 0.0),
    );
    return
      // currentLocation == null
      //     ? Container(
      //   color: Colors.white,
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   alignment: Alignment.center,
      //   child: const CircularProgressIndicator(),
      // )
      //     :
      Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          color: Colors.black87,

          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            color: Colors.black87,
            // child:GoogleMap( //Map widget from google_maps_flutter package
            //   zoomGesturesEnabled: true, //enable Zoom in, out on map
            //   initialCameraPosition: CameraPosition( //innital position in map
            //     target: showLocation, //initial position
            //     zoom: 15.0, //initial zoom level
            //   ),
            //   markers: getmarkers(), //markers to show on map
            //   mapType: MapType.normal, //map type
            //   onMapCreated: (controller) { //method called when map is created
            //     setState(() {
            //       mapController = controller;
            //     });
            //   },
            // ),


            child: Stack(

              children: [


                GoogleMap( //Map widget from google_maps_flutter package
                onTap: _handleTap,
                  myLocationEnabled:true,
              zoomGesturesEnabled: true, //enable Zoom in, out on map
              initialCameraPosition: initialCameraPosition,
              markers: markers, //markers to show on map
              mapType: MapType.normal, //map type
              onMapCreated: (controller) { //method called when map is created
                setState(() {
                  mapController = controller;
                  controller.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: showLocation,
                          zoom: 15.89,
                        ),
                      ));
                  // controller.animateCamera(
                  //   CameraUpdate.newLatLngBounds(
                  //       LatLngBounds(
                  //           southwest: LatLng(
                  //               currentLocation!.latitude! ,
                  //               currentLocation!.longitude!),
                  //           northeast: LatLng(
                  //              currentLocation!.latitude! ,currentLocation!.longitude! ,)),0.0),
                  // );
                });
              },
            ),

              // SizedBox(height: MediaQuery.of(context).size.height * 0.6,),

                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.6),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder:OutlineInputBorder(
                        borderSide:const BorderSide(color:Colors.transparent),
                        borderRadius: BorderRadius.circular(5.5),),

                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color:Colors.transparent),
                        borderRadius: BorderRadius.circular(5.5),),



                      hintText: "Search a place",
                      hintStyle: const TextStyle(
                        color: Color(0xFFA2A0A0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),

                // SizedBox(height: MediaQuery.of(context).size.height * 0.04,),


                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.7),

                  child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(120))
                          ),
                          child: IconButton(onPressed:() {
                            if(currentMarkerLatLng!=null)
                              {
                                _removeMarker();
                              }
                          },

                            icon: const Icon(Icons.cancel_outlined,
                              color: Colors.redAccent,
                              size: 32,
                            ),)

                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent, // Background color
                          minimumSize: const Size(150, 60),

                          shape:  RoundedRectangleBorder(
                            borderRadius:  BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {},

                        child: const Text("Search",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(120))
                          ),

                          child: IconButton(onPressed: () async {

                            await FirebaseFirestore.instance
                                .collection('Location')
                                .doc("${FirebaseAuth.instance.currentUser?.email}")
                                .set({
                              "latitude": currentLocation?.latitude,
                              "longitude": currentLocation?.longitude,
                              "name": "Marker$marker"
                            });
                            if(mounted)
                              {
                                setState(() {
                                  currentMarkerLatLng?.latitude==null;
                                  marker=marker+1;
                                });
                              }
                          },
                            icon: const Icon(Icons.check_circle_outline,
                              color: Colors.greenAccent,
                              size: 32,
                            ),)

                      ),
                    ],
                  ),
                ),

                // SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.8),
                  child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  },

                    icon: const Icon(Icons.arrow_back,
                      color: Colors.white,
                      size: 50,
                    ),),
                ),


                // SizedBox(height: MediaQuery.of(context).size.height * 0.04,),


                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.9),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeUser()));
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

                        icon: const Icon(Icons.location_on_sharp,
                          color: Colors.blueAccent,
                          size: 40,
                        ),),

                    ],
                  ),
                ),





              ],
            ),

          )

      ),

    );
  }

  // Set<Marker> getmarkers() { //markers to place on map
  //   setState(() {
  //     markers.add(Marker( //add first marker
  //       markerId: MarkerId(showLocation.toString()),
  //       position: showLocation, //position of marker
  //       infoWindow: InfoWindow( //popup info
  //         title: 'Marker Title First ',
  //         snippet: 'My Custom Subtitle',
  //       ),
  //       icon: BitmapDescriptor.defaultMarker, //Icon for Marker
  //     ));
  //
  //     markers.add(Marker( //add second marker
  //       markerId: MarkerId(showLocation.toString()),
  //       position: LatLng(27.7099116, 85.3132343), //position of marker
  //       infoWindow: InfoWindow( //popup info
  //         title: 'Marker Title Second ',
  //         snippet: 'My Custom Subtitle',
  //       ),
  //       icon: BitmapDescriptor.defaultMarker, //Icon for Marker
  //     ));
  //
  //     markers.add(Marker( //add third marker
  //       markerId: MarkerId(showLocation.toString()),
  //       position: LatLng(27.7137735, 85.315626), //position of marker
  //       infoWindow: InfoWindow( //popup info
  //         title: 'Marker Title Third ',
  //         snippet: 'My Custom Subtitle',
  //       ),
  //       icon: BitmapDescriptor.defaultMarker, //Icon for Marker
  //     ));
  //
  //     //add more markers here
  //   });
  //
  //   return markers;
  // }
  _handleTap(LatLng point) {
    // currentMarkerLatLng.latitude=
    if(currentMarkerLatLng?.latitude==null)
      {
        if(marker<=3)
          {
            debugPrint("point${point.latitude}");
            setState(() {
              // currentMarkerLat =
              // currentMarkerLng =;
              currentMarkerLatLng = LatLng(point.latitude, point.longitude);
              markers.add(Marker(
                markerId: MarkerId(point.toString()),
                position: point,
                infoWindow: const InfoWindow(
                  title: 'I am a marker',
                ),
                icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
              ));
            });
          }
        else
        {
          Toasts.getSuccessToast(text: "Can't add more than three markers?");
        }
      }

    else
      {
        Toasts.getSuccessToast(text: "Kindly, select what to do with first marker?");
      }
  }
  _removeMarker() {
    try{
      setState(() {
        markers.remove(markers.firstWhere((Marker marker) => marker.markerId.value == currentMarkerLatLng.toString()));
      });
    }
    catch(e){
      debugPrint("error${e.toString()}");
    }
  }

}
