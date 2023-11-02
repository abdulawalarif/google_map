import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(target: LatLng(23.8759, 90.3795),
  zoom: 15
  );

  List<Marker> _marker = [];
  final List<Marker> _list =   [
    const Marker(
        markerId: MarkerId("1"),
     position:  LatLng(23.8759, 90.3795),
    infoWindow: InfoWindow(
      title: "Uttara"
    )
    ),
    const Marker(
        markerId: MarkerId("2"),
     position:  LatLng(23.8759, 90.3791),
    infoWindow: InfoWindow(
      title: "Uttara2"
    )
    ),
    const Marker(
        markerId: MarkerId("3"),
     position:  LatLng(23.7461, 90.3742),
    infoWindow: InfoWindow(
      title: "Dhanmondi"
    )
    ),

  ];


  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
       initialCameraPosition: _kGooglePlex,

        mapType: MapType.normal,
       markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
    );
  }
}
