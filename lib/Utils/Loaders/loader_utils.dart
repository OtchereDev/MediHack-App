
import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: Utils.screenHeight(context),
      width: Utils.screenWidth(context),
      color: AppColors.WHITE,
      child: Center(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: LottieBuilder.asset('assets/images/ambulance.json', ),
        ),
      )),
    );
  }
}
