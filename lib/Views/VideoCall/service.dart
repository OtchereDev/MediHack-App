import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergency_alert/Model/Call/call_response.dart';

class CallService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> initiateCall({
    required String callerID,
    required String callerName,
    required String receiverID,
    required String receiverName,
    required bool isVideoCall,
  }) async {
    final callID = DateTime.now().millisecondsSinceEpoch.toString();
    final call = Call(
      callID: callID,
      callerID: callerID,
      callerName: callerName,
      receiverID: receiverID,
      receiverName: receiverName,
      isVideoCall: isVideoCall,
      startTime: DateTime.now(),
      callStatus: 'ringing',
    );

    await _firestore.collection('calls').doc(callID).set(call.toMap());
  }

  Stream<Call?> listenForIncomingCalls(String userID) {
    return _firestore
        .collection('calls')
        .where('receiverID', isEqualTo: userID)
        .where('callStatus', isEqualTo: 'ringing')
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        return Call.fromMap(snapshot.docs.first.data());
      }
      return null;
    });
  }
Stream<dynamic> listenForIncomingRequest(String driverId) {
  return _firestore
      .collection('driver_locations')
      .doc(driverId)
      .snapshots()
      .map((snapshot) {
    if (snapshot.exists) {
      var data = snapshot.data();
      if (data!['status'] == "CALLED") {
        return (data);
      }
    }
    return null;
  });
}
  Future<void> updateCallStatus(String callID, String status) async {
    await _firestore.collection('calls').doc(callID).update({
      'callStatus': status,
      'endTime': status == 'ended' ? Timestamp.now() : null,
    });
  }
}
