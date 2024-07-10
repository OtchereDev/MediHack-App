
import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Core/app_constants.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(logo, width: 200, ),
                Container(),
           
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
