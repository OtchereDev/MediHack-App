// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:flutter_image/flutter_image.dart';


// class AmbulanceMap extends StatefulWidget {
//   final double currentLat;
//   final double currentLng;
//   final String destinationAddress;

//   AmbulanceMap({required this.currentLat, required this.currentLng, required this.destinationAddress});

//   @override
//   _AmbulanceMapState createState() => _AmbulanceMapState();
// }

// class _AmbulanceMapState extends State<AmbulanceMap> {
//   late GoogleMapController mapController;
//   late LatLng destinationLatLng;
//   Set<Marker> _markers = {};
//   Set<Polyline> _polylines = {};

//   BitmapDescriptor? ambulanceIcon;
//   BitmapDescriptor? hospitalIcon;

//   @override
//   void initState() {
//     super.initState();
//     _loadCustomIcons();
//     _setDestinationLatLng();
//   }

//   Future<void> _loadCustomIcons() async {
//     ambulanceIcon = await _createCustomMarkerImage('assets/icons/ambulance.png', 150);
//     hospitalIcon = await _createCustomMarkerImage('assets/icons/hospital.png', 150);
//     _setMarkersAndPolylines();
//   }

//   Future<BitmapDescriptor> _createCustomMarkerImage(String path, int width) async {
//     final ByteData data = await rootBundle.load(path);
//     final ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
//     final ui.FrameInfo fi = await codec.getNextFrame();
//     final ByteData? byteData = await fi.image.toByteData(format: ui.ImageByteFormat.png);
//     final Uint8List resizedImageData = byteData!.buffer.asUint8List();
//     return BitmapDescriptor.fromBytes(resizedImageData);
//   }



//   void _setMarkersAndPolylines() {
//     if (ambulanceIcon != null && hospitalIcon != null) {
//       _markers.add(Marker(
//         markerId: MarkerId('ambulance'),
//         position: LatLng(widget.currentLat, widget.currentLng),
//         icon: ambulanceIcon!,
//       ));

//       _markers.add(Marker(
//         markerId: MarkerId('destination'),
//         position: destinationLatLng,
//         icon: hospitalIcon!,
//       ));

//       _polylines.add(Polyline(
//         polylineId: PolylineId('route'),
//         points: [
//           LatLng(widget.currentLat, widget.currentLng),
//           destinationLatLng,
//         ],
//         color: Colors.blue,
//         width: 5,
//       ));

//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       onMapCreated: (controller) {
//         mapController = controller;
//       },
//       initialCameraPosition: CameraPosition(
//         target: LatLng(widget.currentLat, widget.currentLng),
//         zoom: 18.0,
//       ),
//       markers: _markers,
//       polylines: _polylines,
//     );
//   }
// }
