import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Image.asset(
            "assets/images/getStarted.jpg",
            height: Utils.screenHeight(context),
            width: Utils.screenWidth(context),
            fit: BoxFit.cover,
          ),
          Container(
            height: Utils.screenHeight(context),
            width: Utils.screenWidth(context),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
         
        ],
      
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback? onTap;
  const CustomButton({
    super.key,
    required this.title,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      color: color,
      child: Text(title),
    );
  }
}
