import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Model/abulance_model.dart';
import 'package:emergency_alert/Provider/Ambulance/ampbulance_provider.dart';
import 'package:emergency_alert/Views/Ambulance/mapview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EMTAmbulanceScreen extends StatefulWidget {
  const EMTAmbulanceScreen({super.key});

  @override
  State<EMTAmbulanceScreen> createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<EMTAmbulanceScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      context.read<AmbulanceStatusProvider>().getTripDetails();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Consumer<AmbulanceStatusProvider>(

        builder: (context, provider, child) {

          if (provider.tripData == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return AmbulanceInfo(provider.tripData!);
          }
        },
      ),
    );
  }
}

class AmbulanceInfo extends StatelessWidget {
  final dynamic status;

  const AmbulanceInfo(this.status, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       const GoogleMapPage(),
        Padding(
          padding: const EdgeInsets.only(bottom: 40.0, right: 20, left: 20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,

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
                      Text('ETA Name: ${status['currentRideDetails']['riderName']}'),
                      Text(
                          'Current Location: ${status['currentRideDetails']['destinationInText']}'),
                    
                    ],
                  ),
                ),
                AppSpaces.height16,
                Container(
                  width: double.infinity,
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
                      Text('Destination: ${status['currentRideDetails']['destinationInText']}'),
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