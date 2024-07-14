import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class CallButton extends StatelessWidget {
  const CallButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      child: SizedBox(
        height: 180, width: 140,
        child: Stack(
          children: [
        
            LottieBuilder.asset("assets/images/call_empty.json", height: 180, width: 180, fit: BoxFit.contain,),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset("assets/icons/sos_outline.svg", color: AppColors.WHITE, width: 30, height: 30,)),
          ],
        ),
      ),
    );
  }
}