import 'package:emergency_alert/Core/Helpers/navigation_helper.dart';
import 'package:emergency_alert/EMAUser/ampbulance_page.dart';
import 'package:emergency_alert/Model/Call/call_response.dart';
import 'package:emergency_alert/Provider/Ambulance/ampbulance_provider.dart';
import 'package:emergency_alert/Views/Ambulance/ampbulance_page.dart';
import 'package:emergency_alert/Views/VideoCall/video_call_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncomingCallWidget extends StatelessWidget {
  final  call;

  const IncomingCallWidget({required this.call});

  @override
  Widget build(BuildContext context) {
    return Consumer<AmbulanceStatusProvider>(
      builder: (context, ambul, _) {
        return AlertDialog(
          title: Text('Incoming Request'),
          // content: Text('From: ${call['data']['currentRideDetails']['destinationInText']}'),
          actions: [
            TextButton(
              onPressed: () async{
               await ambul.acceptRequest(context, {}).then((val){
                  if(val == true){
                    AppNavigationHelper.navigateToWidget(context, EMTAmbulanceScreen());
                  }
                });
              },
              child: Text('Accept'),
            ),
            TextButton(
              onPressed: () {
                // Handle call rejection
              },
              child: Text('Reject'),
            ),
          ],
        );
      }
    );
  }
}
