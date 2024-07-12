import 'package:emergency_alert/Model/abulance_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AmbulanceStatusProvider with ChangeNotifier {
  AmbulanceStatus? _ambulanceStatus;

  AmbulanceStatus? get ambulanceStatus => _ambulanceStatus;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AmbulanceStatusProvider() {
    _firestore.collection('ambulances').doc('currentStatus').snapshots().listen((snapshot) {
      _ambulanceStatus = AmbulanceStatus.fromMap(snapshot.data() as Map<String, dynamic>);
      notifyListeners();
    });
  }
}
