
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
// import 'package:pin_code_text_field/pin_code_text_field.dart';

class DialogUtils {
  static showNativeAlertDialog(BuildContext context,
      {String? title, String? message, Key? key}) {
    return showPlatformDialog(
      context: context,
      builder: (context) => BasicDialogAlert(
        title: Text(title ?? ""),
        content: Text(message ?? ""),
        actions: <Widget>[
          BasicDialogAction(
            title: const Text("Ok", style: TextStyle(color: Colors.black)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
  
  static showNativeActionAlertDialog(BuildContext context,
      {String? title,
      String? message,
      bool? cantPop,
      Key? key,
      required VoidCallback action}) {
    return showPlatformDialog(
      context: context,
    
      builder: (context) => BasicDialogAlert(
        title: Text(title ?? ""),
        content: Text(message ?? ""),
        actions: <Widget>[
          BasicDialogAction(
            title: const Text("Cancel", style: TextStyle(color: Colors.black)),
            onPressed: () {
              (cantPop == true) ? action() : Navigator.pop(context);
            },
          ),
          BasicDialogAction(
            title: const Text("Ok", style: TextStyle(color: Colors.black)),
            onPressed: action,
          ),
        ],
      ),
    );
  }

  httpTimeOutDialog(context) => showNativeAlertDialog(context,
      title: "Timeout",
      message: "Connection Timed out. Please try again later.");

  httpNetworkExceptionDialog(context) => showNativeAlertDialog(context,
      message: "Connection Failed. Please try again later.",
      title: "Network Problem");

  httpErrorDialog(context) => showNativeAlertDialog(context,
      message: "An Error Occurred. Please try again later.",
      title: " An Error occurred");
}
