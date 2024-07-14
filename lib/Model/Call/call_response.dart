class Call {
  String callID;
  String callerID;
  String callerName;
  String receiverID;
  String receiverName;
  bool isVideoCall;
  DateTime startTime;
  DateTime? endTime;
  String callStatus;

  Call({
    required this.callID,
    required this.callerID,
    required this.callerName,
    required this.receiverID,
    required this.receiverName,
    required this.isVideoCall,
    required this.startTime,
    this.endTime,
    required this.callStatus,
  });

  Map<String, dynamic> toMap() {
    return {
      'callID': callID,
      'callerID': callerID,
      'callerName': callerName,
      'receiverID': receiverID,
      'receiverName': receiverName,
      'isVideoCall': isVideoCall,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
      'callStatus': callStatus,
    };
  }

  factory Call.fromMap(Map<String, dynamic> map) {
    return Call(
      callID: map['callID'],
      callerID: map['callerID'],
      callerName: map['callerName'],
      receiverID: map['receiverID'],
      receiverName: map['receiverName'],
      isVideoCall: map['isVideoCall'],
      startTime: DateTime.parse(map['startTime']),
      endTime: map['endTime'] != null ? DateTime.parse(map['endTime']) : null,
      callStatus: map['callStatus'],
    );
  }
}
