import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Formatters {
  static List<String> countryCodes = ["+233", "+234", "+44", "+1"];
  static String removeZeroFormNumber(String number) {
    String correctNumber = "";
    if (number[0] == "0") {
      correctNumber = (number.substring(1));
    } else {
      correctNumber = (number);
    }
    return correctNumber;
  }

  static String formatToInternationNumber(String countryCode, String number) {
    if (number[0] == "+") {
      return number;
    }
    return countryCode + removeZeroFormNumber(number);
  }

  static String removeCountryCode(String number) {
    String result = number
        .replaceAll('+233', '')
        .replaceAll('+234', '')
        .replaceAll("+1", "");
    return result;
  }

  static String getLocalNumber(String number) {
    if (number == '') return '';
    return number.substring(number.length - 9);
  }

  static String formatUserTime(String time) {
    String periodType = time.trim().substring(time.length - 2);
    String newTime = time.trim().substring(0, 5);

    return '$newTime $periodType';
  }

  static dynamic uTCDateFormat(DateTime dateTime) {
    var val = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(dateTime);
    var offset = dateTime.timeZoneOffset;
    var hours =
        offset.inHours > 0 ? offset.inHours : 1; // For fixing divide by 0

    if (!offset.isNegative) {
      val =
          "$val+${offset.inHours.toString().padLeft(2, '0')}:${(offset.inMinutes % (hours * 60)).toString().padLeft(2, '0')}";
    } else {
      val =
          "$val-${(-offset.inHours).toString().padLeft(2, '0')}:${(offset.inMinutes % (hours * 60)).toString().padLeft(2, '0')}";
    }
    return val;
  }

  static String getApproxTime(String movTime, String finishTime) {
    String periodType = "PM";
    final startTime = TimeOfDay(
        hour: int.parse(movTime.substring(0, 1)),
        minute: int.parse(movTime.substring(3, 4)));

    final endTime = TimeOfDay(
        hour: int.parse(finishTime.substring(0, 1)),
        minute: int.parse(finishTime.substring(3, 4)));

    var time = TimeOfDay(
        hour: startTime.hour + endTime.hour,
        minute: startTime.minute + endTime.minute);
    return "${time.hour}:${time.minute}$periodType";
  }

  static String getPayCardStr(String code) {
    final int length = code.length;
    final int replaceLength = length - 4;
    final String replacement =
        List<String>.generate((replaceLength / 4).ceil(), (int _) => '**** ')
            .join('');
    return code.replaceRange(0, replaceLength, replacement);
  }


  static Future<void> makeCall(String number)async{
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: number,
  );
  if (await canLaunch(launchUri.toString())) {
    await launch(launchUri.toString());
  } else {
    throw 'Could not launch $launchUri';
  }
  }
}
