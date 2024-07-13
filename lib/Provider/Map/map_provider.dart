import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:emergency_alert/Core/app_constants.dart';
import 'package:emergency_alert/Model/abulance_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MapProvider with ChangeNotifier {
  final Location locationController = Location();

  AmbulanceStatus? _ambulanceStatus;

  AmbulanceStatus? get ambulanceStatus => _ambulanceStatus;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  LatLng _destinationLoc = LatLng(37.4223, -122.0848);
  LatLng get destinationLoc => _destinationLoc;

  static const googlePlex = LatLng(37.4223, -122.0848);
  static const mountainView = LatLng(37.3861, -122.0839);

  LatLng? _currentPosition;
  LatLng? get currentPosition => _currentPosition;
  Map<PolylineId, Polyline> polylines = {};

  BitmapDescriptor? ambulanceIcon;
  BitmapDescriptor? hospitalIcon;

  MapProvider() {
    initializeMap();
  }

  Future<void> initializeMap() async {
    await firebaseData();
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

  Future<void> firebaseData() async {
    _firestore.collection('ambulances').doc('currentStatus').snapshots().listen((snapshot) {
      _ambulanceStatus = AmbulanceStatus.fromMap(snapshot.data() as Map<String, dynamic>);
      // _destinationLoc = LatLng(_ambulanceStatus?.currentLat ?? 0.0, _ambulanceStatus?.currentLng ?? 0.0);
      notifyListeners();
    });
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
        _currentPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        notifyListeners();
      }
    });
  }

  Future<List<LatLng>> fetchPolylinePoints() async {
    print("${googlePlex.latitude},${googlePlex.longitude}&destination=${_destinationLoc.latitude},${_destinationLoc.longitude}&key=$kGoogleApiKey");
    final String url = 'https://maps.googleapis.com/maps/api/directions/json?origin=${googlePlex.latitude},${googlePlex.longitude}&destination=${_destinationLoc.latitude},${_destinationLoc.longitude}&key=$kGoogleApiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if ((data['routes'] as List).isNotEmpty) {
        final String polylineString = data['routes'][0]['overview_polyline']['points'];
        final List<LatLng> polylineCoordinates = _decodePolyline(polylineString);
        return polylineCoordinates;
      } else {
        debugPrint('No routes found');
        return [];
      }
    } else {
      debugPrint('Error fetching directions: ${response.statusCode}');
      return [];
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> polyline = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      LatLng position = LatLng((lat / 1E5).toDouble(), (lng / 1E5).toDouble());
      polyline.add(position);
    }

    return polyline;
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
