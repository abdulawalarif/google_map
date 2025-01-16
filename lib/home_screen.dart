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
  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(23.8759, 90.3795), zoom: 15);

  List<Marker> _marker = [];
  final List<Marker> _list = [
    const Marker(
        markerId: MarkerId("1"),
        position: LatLng(23.8759, 90.3795),
        infoWindow: InfoWindow(title: "Uttara")),
    const Marker(
        markerId: MarkerId("2"),
        position: LatLng(23.8759, 90.375),
        infoWindow: InfoWindow(title: "Uttara 2")),
    const Marker(
        markerId: MarkerId("3"),
        position: LatLng(23.8756, 90.373),
        infoWindow: InfoWindow(title: "Uttara 3")),
    const Marker(
        markerId: MarkerId("4"),
        position: LatLng(23.8859, 90.383),
        infoWindow: InfoWindow(title: "Uttara 4")),
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          markers: Set<Marker>.of(_marker),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.my_location),
          onPressed: () async {
            GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(target: LatLng(23.7461, 90.3742), zoom: 14)));
          },
        ),
      ),
    );
  }
}
