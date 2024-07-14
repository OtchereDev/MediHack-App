import 'package:emergency_alert/Model/Call/call_response.dart';
import 'package:emergency_alert/Provider/Auth/login_provider.dart';
import 'package:emergency_alert/Provider/Profile/profile_provider.dart';
import 'package:emergency_alert/Views/VideoCall/service.dart';
import 'package:emergency_alert/Views/VideoCall/widget/incoming_call.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:firebase_core/firebase_core.dart';
class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, profile, _) {
        return StreamBuilder<Call?>(
          stream: CallService().listenForIncomingCalls(profile.currentUserProfile!.id.toString()),
          builder: (context, snapshot) {
            print(snapshot.data?.toMap());
            if (snapshot.hasData && snapshot.data != null) {
              return IncomingCallWidget(call: snapshot.data!);
            }
            return Scaffold(
              appBar: AppBar(
                title: Text('Home'),
              ),
              body: Center(
                child: Text('No incoming calls${snapshot.data?.callID}'),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: (){
                  CallService().initiateCall(callerID: profile.currentUserProfile!.id.toString(), callerName: profile.currentUserProfile!.name, receiverID: snapshot.data!.receiverID, receiverName: snapshot.data!.receiverName, isVideoCall: true);

                },
              ),
            );
            
          },
        );
      }
    );
  }
}