import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Views/Ambulance/mapview.dart';
import 'package:emergency_alert/Views/GetStarted/getstarted.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchingForNearestAmbulance extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  const SearchingForNearestAmbulance({super.key, this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GoogleMapPage(),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.WHITE,
                borderRadius: BorderRadius.circular(6)
            
              ),
              child: Text("Searching for $title", style: const TextStyle(fontSize: 17),),
            ),
          ),
        ),
        Container(
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
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left:20.0,bottom: 20, right: 20 ),
              child: CustomButton(title: "Request", color: AppColors.PRIMARYCOLOR, onTap:onTap,),
            )))
      ],
    );
  }
}
