import 'package:emergency_alert/Model/Call/call_response.dart';
import 'package:emergency_alert/Provider/Profile/profile_provider.dart';
import 'package:emergency_alert/Views/Maps/myLocation_map.dart';
import 'package:emergency_alert/Views/VideoCall/service.dart';
import 'package:emergency_alert/Views/VideoCall/widget/incoming_call.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:firebase_core/firebase_core.dart';
class ResponderHomeScreen extends StatelessWidget {
  const ResponderHomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, profile, _) {
        return StreamBuilder<dynamic>(
          stream: CallService().listenForIncomingRequest("K1234567890"),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
            // print(snapshot.data['data']['currentRideDetails']['destinationInText']);
              return IncomingCallWidget(call: snapshot.data!);
            }
            return Scaffold(
             
              body: Stack(children: [
                MyLocationMap()
              ],)
              
            );
            
          },
        );
      }
    );
  }
}