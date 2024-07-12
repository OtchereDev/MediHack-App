import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Model/abulance_model.dart';
import 'package:emergency_alert/Provider/Ambulance/ampbulance_provider.dart';
import 'package:emergency_alert/Views/Ambulance/ambulance_map.dart';
import 'package:emergency_alert/Views/Ambulance/mapview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AmbulanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Ambulance Tracker'),
      // ),
      body: Consumer<AmbulanceStatusProvider>(
        builder: (context, provider, child) {
          if (provider.ambulanceStatus == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return AmbulanceInfo(provider.ambulanceStatus!);
          }
        },
      ),
    );
  }
}

class AmbulanceInfo extends StatelessWidget {
  final AmbulanceStatus status;

  const AmbulanceInfo(this.status, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMapPage(),
        // AmbulanceMap(
        //   currentLat: status.currentLat,
        //   currentLng: status.currentLng,
        //   destinationAddress: status.destinationAddress,
        // ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40.0, right: 20, left: 20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                   padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.WHITE),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Ambulance En Route',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text('ETA: ${status.eta}'),
                      Text(
                          'Current Location: ${status.currentLocationAddress}'),
                    
                    ],
                  ),
                ),
                AppSpaces.height16,
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.WHITE),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Destination for patient',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text('Destination: ${status.destinationAddress}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
