import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goodle Map added',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Adding Google Map'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//defining and declaring the variable and methods for the state of the google map

  GoogleMapController? mapController; //controller for Google map
  Set<Marker> markers = {}; //markers for google map
  LatLng showLocation =
      const LatLng(27.7089427, 85.3086209); //location to show on map

  void initstate() {
    markers.add(Marker(
      markerId: MarkerId(showLocation.toString()),
      position: showLocation,
      infoWindow: const InfoWindow(
        title: 'Title Goes Here',
        snippet: 'Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //icon for marker
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google map in flutter'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: GoogleMap(
          zoomGesturesEnabled: true, //enabling zoom in and out
          initialCameraPosition: CameraPosition(
            target: showLocation, //my initial position
            zoom: 10.0, //my initial zoom level
          ),
          markers: markers, //markers to show on map
          mapType: MapType.normal, // this is the map type
          onMapCreated: (controller) {
            setState(() {
              mapController = controller;
            });
          }, //when map is created, this method would be called
        ),
      ),
    );
  }
}
