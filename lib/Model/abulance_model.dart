class AmbulanceStatus {
  final String eta;
  final String destinationAddress;
  final String currentLocationAddress;
  final double currentLat;
  final double currentLng;

  AmbulanceStatus({
    required this.eta,
    required this.destinationAddress,
    required this.currentLocationAddress,
    required this.currentLat,
    required this.currentLng,
  });

  factory AmbulanceStatus.fromMap(Map<String, dynamic> data) {
    return AmbulanceStatus(
      eta: data['eta'],
      destinationAddress: data['destinationAddress'],
      currentLocationAddress: data['currentLocationAddress'],
      currentLat: data['currentLat'],
      currentLng: data['currentLng'],
    );
  }
}
