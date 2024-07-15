import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Utils/formatters.dart';
import 'package:emergency_alert/Views/Home/home_page.dart';
import 'package:emergency_alert/Views/Home/nearby_hospitals.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyNumbers extends StatelessWidget {
  const EmergencyNumbers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomBack(
              title: "Add Emergency Contact",
              hasBack: true,
            ),
            const CustomDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppSpaces.height20,
                  AppSpaces.height20,
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text("911"),
                    leading: Image.asset(
                      'assets/icons/emergency-call.png',
                      height: 30,
                      width: 30,
                    ),
                    trailing: Icon(Icons.call),
                    onTap: () async {
                      _makePhoneCall("911");
                    },
                  ),
                  CustomDivider(),
                  AppSpaces.height20,
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text("Ambulance"),
                    leading: Image.asset(
                      'assets/icons/ambulance.png',
                      height: 30,
                      width: 30,
                    ),
                    onTap: () {
                      Formatters.makeCall("911");
                    },
                    trailing: Icon(Icons.call),
                  ),
                  CustomDivider(),
                  AppSpaces.height20,
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text("Fire Station"),
                    leading: Image.asset(
                      'assets/icons/firefighter.png',
                      height: 30,
                      width: 30,
                    ),
                    trailing: Icon(Icons.call),
                    onTap: () {
                      Formatters.makeCall("911");
                    },
                  ),
                  CustomDivider(),
                  AppSpaces.height20,
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text("Police"),
                    leading: Image.asset(
                      'assets/icons/police.png',
                      height: 30,
                      width: 30,
                    ),
                    trailing: Icon(Icons.call),
                    onTap: () {
                      Formatters.makeCall("911");
                    },
                  ),
                  AppSpaces.height20
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

void _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  if (await canLaunch(launchUri.toString())) {
    await launch(launchUri.toString());
  } else {
    throw 'Could not launch $launchUri';
  }
}
}
