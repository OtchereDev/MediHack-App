import 'package:emergency_alert/Model/Response/hospital_response.dart';
import 'package:emergency_alert/Model/Ride/ride_search_response.dart';
import 'package:emergency_alert/Model/abulance_model.dart';
import 'package:emergency_alert/Services/Remote/Emergency/emergency_services.dart';
import 'package:emergency_alert/Services/Remote/RideRequest/ride_request_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AmbulanceStatusProvider with ChangeNotifier {
  final emerService = EmergencyService();
  final _rideRequestService = RideRequestService();
  AmbulanceStatus? _ambulanceStatus;

  AmbulanceStatus? get ambulanceStatus => _ambulanceStatus;

  HospitalResponse? _hospitalResponse;
  HospitalResponse? get hospitalResponse => _hospitalResponse;

  RideSearchResponse? _rideSearchResponse;
  RideSearchResponse? get rideSearchResponse => _rideSearchResponse;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _loadPage = false;
  bool get loadingPage => _loadPage;

  bool _loadRide = false;
  bool get loadingRide => _loadRide;

  setLoading(bool load) {
    _loadPage = load;
    notifyListeners();
  }

  setLoadingRide(bool load) {
    _loadRide = load;
    notifyListeners();
  }

  AmbulanceStatusProvider() {
    _firestore
        .collection('ambulances')
        .doc('currentStatus')
        .snapshots()
        .listen((snapshot) {
      _ambulanceStatus =
          AmbulanceStatus.fromMap(snapshot.data() as Map<String, dynamic>);
      notifyListeners();
    });
  }

  Future<void> getNearestHospital(context, LatLng cordinate) async {
    setLoading(true);
    await emerService.nearestHospital(context,
        {"latitude": "51.564699", "longitude": "-0.248392"}).then((res) {
      setLoading(false);
      if (res["status"] == true) {
        _hospitalResponse = HospitalResponse.fromJson(res['data']);
        notifyListeners();
      }
    });
  }

  getImageLink(String ref) {
    return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$ref&key=AIzaSyAvemlo0evhkyyMw59Rei89f59qfK4jTpg";
  }

  Future<void> goOnline(context, data) async {
    await _rideRequestService.goOnline(context, data).then((response) {
      if (response['status'] == true) {}
    });
  }

  Future<dynamic> searchAmbulance(context, data) async {
    setLoadingRide(true);
    Map<String, dynamic> data = {
      "action": "SEARCH-RIDE",
      "riderId": "K1234567890",
      "latitude": "5.6214902",
      "longitude": "-0.1829054"
    };

    await _rideRequestService.goOnline(context, data).then((response) {
      setLoadingRide(false);
      print("RIDE SEARCH: $response");
      if (response['status'] == true) {
        _rideSearchResponse = RideSearchResponse.fromJson(response['data']);
        notifyListeners();
      }
    });
  }
}
