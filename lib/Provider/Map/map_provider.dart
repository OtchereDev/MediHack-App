import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:emergency_alert/Core/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class MapProvider with ChangeNotifier {
  final Location locationController = Location();

  static const LatLng googlePlex = LatLng(37.4223, -122.0848);
  static const LatLng mountainView = LatLng(37.3861, -122.0839);

  LatLng? currentPosition;
  Map<PolylineId, Polyline> polylines = {};

  BitmapDescriptor? ambulanceIcon;
  BitmapDescriptor? hospitalIcon;

  MapProvider() {
    initializeMap();
  }

  Future<void> initializeMap() async {
    await _loadCustomIcons();
    await fetchLocationUpdates();
    final coordinates = await fetchPolylinePoints();
    generatePolyLineFromPoints(coordinates);
  }

  Future<void> _loadCustomIcons() async {
    ambulanceIcon = await _createCustomMarkerImage('assets/icons/ambulance.png', 100);
    hospitalIcon = await _createCustomMarkerImage('assets/icons/hospital.png', 100);
    notifyListeners();
  }

  Future<BitmapDescriptor> _createCustomMarkerImage(String path, int width) async {
    final ByteData data = await rootBundle.load(path);
    final ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    final ui.FrameInfo fi = await codec.getNextFrame();
    final ByteData? byteData = await fi.image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List resizedImageData = byteData!.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(resizedImageData);
  }

  Future<void> fetchLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationController.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationController.onLocationChanged.listen((currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        currentPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        notifyListeners();
      }
    });
  }

  Future<List<LatLng>> fetchPolylinePoints() async {
    final polylinePoints = PolylinePoints();

    final result = await polylinePoints.getRouteBetweenCoordinates(
      request: PolylineRequest(origin: PointLatLng(googlePlex.latitude, googlePlex.longitude), destination:  PointLatLng(mountainView.latitude, mountainView.longitude), mode: TravelMode.transit),
      googleApiKey: kGoogleApiKey
     
    );

    if (result.points.isNotEmpty) {
      return result.points.map((point) => LatLng(point.latitude, point.longitude)).toList();
    } else {
      debugPrint(result.errorMessage);
      return [];
    }
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) {
    const id = PolylineId('polyline');

    final polyline = Polyline(
      polylineId: id,
      color: Colors.blueAccent,
      points: polylineCoordinates,
      width: 5,
    );

    polylines[id] = polyline;
    notifyListeners();
  }
}
