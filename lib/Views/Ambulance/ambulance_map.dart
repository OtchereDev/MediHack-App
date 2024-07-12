import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class AmbulanceMap extends StatefulWidget {
  final double currentLat;
  final double currentLng;
  final String destinationAddress;

  AmbulanceMap({required this.currentLat, required this.currentLng, required this.destinationAddress});

  @override
  _AmbulanceMapState createState() => _AmbulanceMapState();
}

class _AmbulanceMapState extends State<AmbulanceMap> {
  late GoogleMapController mapController;
  late LatLng destinationLatLng;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};

  BitmapDescriptor? ambulanceIcon;
  BitmapDescriptor? hospitalIcon;

  @override
  void initState() {
    super.initState();
    _loadCustomIcons();
    _setDestinationLatLng();
  }

  Future<void> _loadCustomIcons() async {
    ambulanceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(20, 20)), 'assets/icons/ambulance.png');
    hospitalIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(20, 20)), 'assets/icons/hospital.png');
    _setMarkersAndPolylines();
  }

  Future<void> _setDestinationLatLng() async {
    List<Location> locations = await locationFromAddress(widget.destinationAddress);
    if (locations.isNotEmpty) {
      destinationLatLng = LatLng(locations[0].latitude, locations[0].longitude);
      _setMarkersAndPolylines();
    }
  }

  void _setMarkersAndPolylines() {
    if (ambulanceIcon != null && hospitalIcon != null) {
      _markers.add(Marker(
        markerId: MarkerId('ambulance'),
        position: LatLng(widget.currentLat, widget.currentLng),
        icon: ambulanceIcon!,
      ));

      _markers.add(Marker(
        markerId: MarkerId('destination'),
        position: destinationLatLng,
        icon: hospitalIcon!,
      ));

      _polylines.add(Polyline(
        polylineId: PolylineId('route'),
        points: [
          LatLng(widget.currentLat, widget.currentLng),
          destinationLatLng,
        ],
        color: Colors.blue,
        width: 5,
      ));

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (controller) {
        mapController = controller;
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.currentLat, widget.currentLng),
        zoom: 14.0,
      ),
      markers: _markers,
      polylines: _polylines,
    );
  }
}
