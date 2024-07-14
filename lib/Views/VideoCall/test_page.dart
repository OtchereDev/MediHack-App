import 'package:emergency_alert/Views/VideoCall/video_call_page.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';



class HomeScreenss extends StatelessWidget {
  final TextEditingController _callIDController = TextEditingController();
  final TextEditingController _userIDController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ZegoCloud CallKit Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _userIDController,
              decoration: InputDecoration(labelText: 'User ID'),
            ),
            TextField(
              controller: _userNameController,
              decoration: InputDecoration(labelText: 'User Name'),
            ),
            TextField(
              controller: _callIDController,
              decoration: InputDecoration(labelText: 'Call ID'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CallPage(
                      callID: _callIDController.text,
                      userID: _userIDController.text,
                      userName: _userNameController.text,
                    ),
                  ),
                );
              },
              child: Text('Start Call'),
            ),
          ],
        ),
      ),
    );
  }
}
