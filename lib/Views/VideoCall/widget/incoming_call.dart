import 'package:emergency_alert/Model/Call/call_response.dart';
import 'package:emergency_alert/Views/VideoCall/video_call_page.dart';
import 'package:flutter/material.dart';

class IncomingCallWidget extends StatelessWidget {
  final Call call;

  const IncomingCallWidget({required this.call});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Incoming Call'),
      content: Text('Caller: ${call.callerName}'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CallPage(
                callID: call.callID,
                userID: call.receiverID,
                userName: 'Receiver Name', // Customize as needed
              ),
            ));
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
}
