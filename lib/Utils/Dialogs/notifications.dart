import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotificationUtils {
  static showToast(context, {required String message}) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 12.0);
  }
}
