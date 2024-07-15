import 'package:emergency_alert/Provider/Ambulance/ampbulance_provider.dart';
import 'package:emergency_alert/Views/Maps/myLocation_map.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class BookingAndWaitingPage extends StatelessWidget {
  const BookingAndWaitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Consumer<AmbulanceStatusProvider>(
        builder: (context, ambulance, _) {
          return Stack(
            children: [
           MyLocationMap(),
                ambulance.loadingRide
                    ? Container(
                        color: Colors.transparent,
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: LottieBuilder.asset(
                              'assets/images/searching.json',
                            ),
                          ),
                        )),
                      )
                    : const SizedBox.shrink(),
            ],
          );
        }
      ),
    );
  }
}