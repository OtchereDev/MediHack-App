import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Bismark!",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Mccarthy Hill",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                              fontWeight: FontWeight.w200),
                        ),
                        AppSpaces.width4,
                        Icon(
                          FeatherIcons.mapPin,
                          color: AppColors.PRIMARYCOLOR,
                          size: 10,
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.PRIMARYCOLOR.withOpacity(0.3)),
                )
              ],
            ),
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    AppSpaces.height16,
                    Text(
                      "Emergency Help \nNeeded?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text("Just hold the button to call", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black54),),
                    AppSpaces.height20,
                    LottieBuilder.asset("assets/images/call.json", height: 250, width: 250, fit: BoxFit.contain,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
