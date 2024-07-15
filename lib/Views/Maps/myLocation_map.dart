import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';



class MyLocationMap extends StatefulWidget {
  @override
  State<MyLocationMap> createState() => MyLocationMapState();
}

class MyLocationMapState extends State<MyLocationMap> {
  late GoogleMapController _controller;
  LatLng _currentPosition = LatLng(0, 0);
  bool _isMapCreated = false;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      if (_isMapCreated) {
        _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: _currentPosition,
          zoom: 14.0,
        )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _currentPosition,
          zoom: 14.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
          setState(() {
            _isMapCreated = true;
            _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: _currentPosition,
              zoom: 14.0,
            )));
          });
        },
        markers: {
          Marker(
            markerId: MarkerId('currentLocation'),
            position: _currentPosition,
          ),
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}