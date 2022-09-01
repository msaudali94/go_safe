import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:go_safe/res/toasts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart'
    show
        GoogleMapsPlaces,
        PlacesAutocompleteResponse,
        Component,
        PlacesDetailsResponse,
        Prediction
    hide Location;
import 'package:location/location.dart';

import 'homeuser.dart';
import 'profileuser.dart';
import 'settings.dart';

class SafeMark extends StatefulWidget {
  const SafeMark({Key? key}) : super(key: key);

  @override
  _SafeMark createState() => _SafeMark();
}

class _SafeMark extends State<SafeMark> {
  String? locationString, lat, lng = "";
  String kGoogleApiKey = "AIzaSyCqGcDZJekuh5y-pUiXZGyWoHEQOZQOe4Q";

  GoogleMapController? controller;
  MarkerId? selectedMarker;
  LatLng? markerPosition;
  GoogleMapController? mapController; //contrller for Google map
  final Set<Marker> markers = {}; //markers for google map
  static LatLng showLocation = const LatLng(27.7089427, 85.3086209);
  LocationData? currentLocation;
  late LocationData destinationLocation;
  late Location location;

  // void _onMapCreated(GoogleMapController controller) {
  //   this.controller = controller;
  // }
  late StreamSubscription<LocationData> subscription;
  double? currentMarkerLat;
  double? currentMarkerLng;
  LatLng? currentMarkerLatLng;
  int marker = 1;

  onMapCreated(GoogleMapController controller) {
    //method called when map is created
    setState(() {
      mapController = controller;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: showLocation,
          zoom: 15.89,
        ),
      ));
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      location = Location();
      subscription = location.onLocationChanged.listen((clocation) {
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
          ? LatLng(
              currentLocation?.latitude ?? 0.0,
              currentLocation?.longitude ?? 0.0,
            )
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
            child: Stack(
              children: [
                GoogleMap(
                  //Map widget from google_maps_flutter package
                  onTap: _handleTap,
                  myLocationEnabled: true,
                  zoomGesturesEnabled: true,
                  //enable Zoom in, out on map
                  initialCameraPosition: initialCameraPosition,
                  markers: markers,
                  //markers to show on map
                  mapType: MapType.normal,
                  //map type
                  onMapCreated: onMapCreated,
                ),

                // SizedBox(height: MediaQuery.of(context).size.height * 0.6,),

                // Padding(
                //   padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.6),
                //   child: TextFormField(
                //     textAlign: TextAlign.center,
                //     obscureText: true,
                //     keyboardType: TextInputType.text,
                //     decoration: InputDecoration(
                //       enabledBorder:OutlineInputBorder(
                //         borderSide:const BorderSide(color:Colors.transparent),
                //         borderRadius: BorderRadius.circular(5.5),),
                //
                //       focusedBorder: OutlineInputBorder(
                //         borderSide: const BorderSide(color:Colors.transparent),
                //         borderRadius: BorderRadius.circular(5.5),),
                //
                //
                //
                //       hintText: "Search a place",
                //       hintStyle: const TextStyle(
                //         color: Color(0xFFA2A0A0),
                //         fontSize: 20.0,
                //         fontWeight: FontWeight.w400,),
                //       filled: true,
                //       fillColor: Colors.white,
                //     ),
                //   ),
                // ),
                getAddressField(
                  hintText:
                      locationString == "" ? "Search location" : locationString,
                  onAddress: () {
                    handlePressButton();
                  },
                ),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.04,),

                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(120))),
                          child: IconButton(
                            onPressed: () {
                              if (currentMarkerLatLng != null) {
                                _removeMarker();
                              }
                            },
                            icon: const Icon(
                              Icons.cancel_outlined,
                              color: Colors.redAccent,
                              size: 32,
                            ),
                          )),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent, // Background color
                          minimumSize: const Size(150, 60),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Search",
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(120))),
                          child: IconButton(
                            onPressed: () async {
                              if(marker<4)
                                {
                                  await FirebaseFirestore.instance
                                      .collection('Marker$marker')
                                      .doc(
                                      "${FirebaseAuth.instance.currentUser?.email}")
                                      .set({
                                    "latitude": currentLocation?.latitude,
                                    "longitude": currentLocation?.longitude,
                                    "name": "Marker$marker"
                                  }).then((value) {
                                    Toasts.getSuccessToast(
                                        text: "Marker Added Successfully");
                                  });
                                  setState(() {
                                    marker = marker + 1;
                                    currentMarkerLatLng=null;
                                  });
                                }
                              else
                                {
                                  Toasts.getWarningToast(text: "No more than three markers can be added.");
                                }

                              // if(mounted)
                              //   {
                              //     setState(() {

                              // });
                              // }
                            },
                            icon: const Icon(
                              Icons.check_circle_outline,
                              color: Colors.greenAccent,
                              size: 32,
                            ),
                          )),
                    ],
                  ),
                ),

                // SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.8, left: MediaQuery.of(context).size.width*0.4),
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

                // SizedBox(height: MediaQuery.of(context).size.height * 0.04,),

                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeUser()));
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
                                  builder: (context) => UserSettings()));
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
                                  builder: (context) => ProfileUser()));
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

  _handleTap(LatLng point) {
    debugPrint("currentMarkerLatLng?.latitude${currentMarkerLatLng?.latitude}");

    // currentMarkerLatLng.latitude=
    if(currentMarkerLatLng?.latitude==null)
      {
    if (marker <= 3) {
      // debugPrint("point${point.latitude}");
      setState(() {
        // currentMarkerLat =
        // currentMarkerLng =;
        currentMarkerLatLng = LatLng(point.latitude, point.longitude);
        markers.add(Marker(
          markerId: MarkerId(point.toString()),
          position: point,
          infoWindow: const InfoWindow(
            title: 'Mark safe location.',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueMagenta),
        ));
      });
    } else {
      Toasts.getWarningToast(text: "Can't add more than three markers?");
    }
      }

    else
      {
        Toasts.getSuccessToast(text: "Kindly, select what to do with first marker?");
      }
  }

  _removeMarker() {
    try {
      setState(() {
        markers.remove(markers.firstWhere((Marker marker) =>
            marker.markerId.value == currentMarkerLatLng.toString()));
      });
    } catch (e) {
      debugPrint("error${e.toString()}");
    }
  }

  Widget getAddressField({String? hintText, required Function onAddress}) {
    return GestureDetector(
      onTap: () {
        onAddress.call();
      },
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.6),
        child: Container(
          height: 60,
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 1),
            // borderRadius: BorderRadius.circular(27),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(93, 93, 93, 0.08),
                blurRadius: 32,
                offset: Offset(15, 15),
              ),
            ],
          ),
          child: TextFormField(
              // controller: controller,
              enabled: false,
              decoration: const InputDecoration(
                // isDense: true,
                border: InputBorder.none,
                // labelText: "ADDRESS",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: TextStyle(
                    // fontFamily: Assets.robotoMedium,
                    letterSpacing: 1.5,
                    color: Color.fromRGBO(81, 92, 111, .50),
                    fontSize: 15.5,
                    fontWeight: FontWeight.normal),
                hintText: "Search Location",
                hintStyle: TextStyle(
                    height: 3.5,
                    // fontFamily: Assets.robotoRegular,
                    color: Colors.black,
                    fontSize: 15.5,
                    fontWeight: FontWeight.normal),
              )),
        ),
      ),
    );
  }

  void onError(PlacesAutocompleteResponse response) {
    Toasts.getErrorToast(text: response.errorMessage.toString());
  }

  Future<void> handlePressButton() async {
    Prediction? p = await PlacesAutocomplete.show(
      offset: 0,
      radius: 1000,
      types: [],
      strictbounds: false,
      apiKey: kGoogleApiKey,
      context: context,
      onError: onError,
      mode: Mode.overlay,
      logo: const Text(""),
      language: "en",
      components: [
        Component(Component.country, "pak"),
        Component(Component.country, "us")
      ],
    );

    if (p != null) {
      displayPrediction(p);
    }
  }

  Future<void> displayPrediction(Prediction p) async {
    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: kGoogleApiKey,
    );

    PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(p.placeId ?? "");
    locationString = p.description.toString();
    lat = detail.result.geometry!.location.lat.toString();
    lng = detail.result.geometry!.location.lng.toString();
    mapController?.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(detail.result.geometry!.location.lat,
            detail.result.geometry!.location.lng),
        14));
    setState(() {});
  }
}
