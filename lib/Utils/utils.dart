import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:emergency_alert/Core/Enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utils {
  static double screenWidth(context) => MediaQuery.of(context).size.width;
  static double screenHeight(context) => MediaQuery.of(context).size.height;

  static Future<String> convertImageToBase64(String imageAsset) async {
    ByteData bytes = await rootBundle.load(imageAsset);
    var buffer = bytes.buffer;
    return base64.encode(Uint8List.view(buffer));
  }

  bool keyboardIsVisible(context) {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }

  String formatDateTimeString(String date) {
    return date.substring(0, 10);
  }

  static double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  static double calculateBearing(lat1, lon1, lat2, lon2) {
    double dLon = (lon2 - lon1);
    double y = sin(dLon) * cos(lat2);
    double x = (cos(lat1) * sin(lat2)) - (sin(lat1) * cos(lat2) * cos(dLon));
    double bearing = atan2(y, x);
    bearing = (360 - ((bearing + 360) % 360));
    return bearing;
  }

   static ScreenSize screenSize(BuildContext context) {
    return screenHeight(context) <= 500
        ? ScreenSize.small
        : screenHeight(context) > 500 && screenHeight(context) <= 786
            ? ScreenSize.medium
            : ScreenSize.large;
  }

  static int daysBetweenDates(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  static String emergencyContactPolice(
      {String? name, String? contact, String? location}) {
    // return "My name is $name and my contact number is $contact. Our vehicle has been attacked by armed robbers at location $location. We need your immediate intervention.";
    return "My%20name%20is%20$name,%20and%20my%20contact%20number%20is%20$contact.Our%20vehicle%20has%20been%20attacked%20by%20armed%20robbers%20at%20location%20at%20location%20$location.%20We%20need%20your%20immediate%20intervention.";
  }

  static String emergencyContactFireService(
      {String? name, String? contact, String? location}) {
    return "My%20name%20is%20$name,%20and%20my%20contact%20number%20is%20$contact.Our%20vehicle%20just%20caught%20fire%20at%20location%20at%20location%20$location.%20We%20need%20your%20immediate%20intervention.";

    // return "My name is $name and my contact number is $contact. Our vehicle just caught fire at location $location. We need your immediate intervention.";
  }

  static String emergencyContactAmbulance(
      {String? name, String? contact, String? location}) {
    return "My%20name%20is%20$name,%20and%20my%20contact%20number%20is%20$contact.Our%20vehicle%20has%20been%20involved%20in%20an%20accident%20at%20location%20$location.%20We%20need%20your%20immediate%20intervention.";
  }
}



  // Future<String> downloadAndSavePDF(context, String pdfUrl, String fileName,
  //     {bool share = false}) async {
  //   String pathUril = "";

  //   setLoading(true);
  //   //  String pdfUrls =  "https://www.cedarville.edu/-/media/Files/PDF/Web-Development-Services/SamplePDF.pdf?la=en&hash=1B9D390C8225C1DDE2155F786C6515A3CEF9D4EC";

  //   final status = await Permission.storage.request();

  //   if (status.isGranted) {
  //     var response = await http.get(Uri.parse(pdfUrl), headers: {});

  //     // "https://www.cedarville.edu/-/media/Files/PDF/Web-Development-Services/SamplePDF.pdf?la=en&hash=1B9D390C8225C1DDE2155F786C6515A3CEF9D4EC");
  //     setLoading(false);
  //     final bytes = response.bodyBytes;
  //     Directory? directory;
  //     String? filePath;

  //     if (Platform.isAndroid) {
  //       String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
  //       filePath = '${selectedDirectory}/$fileName.pdf';
  //     } else {
  //       directory = await getApplicationDocumentsDirectory();
  //      filePath = '${directory.path}/$fileName.pdf';
  //     }


  //     File file = File(filePath);

  //     pathUril = filePath;
  //     notifyListeners();

  //     await file.writeAsBytes(bytes);

  //     !share
  //         ? customDailog(
  //             title: "File",
  //             icon: Icon(
  //               Icons.check_circle,
  //               color: AppColors.GREENCOLOR,
  //             ),
  //             isSuccess: true,
  //             message: 'File downloaded successful')
  //         : null;
  //   } else {
  //     // print('$status Permission denied');
  //     await Permission.storage.request();
  //   }
  //   return pathUril;
  // }