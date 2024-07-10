import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:emergency_alert/Services/Local/shared_prefs_manager.dart';
import 'package:emergency_alert/Utils/Dialogs/dialog_utils.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;


mixin AuthBaseRepository {
  String token = "N/A";
  // SharedPrefsManager _manager = new SharedPrefsManager();

  Future<Map<String, String>> setHeaders() async {
    token = await SharedPrefsManager().getAuthToken();
    return {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
  }

  Future<Map<String, String>> setFileHeaders(mimeType, File image) async {
    token = await SharedPrefsManager().getAuthToken();

    return {
      'Content-type': mimeType,
      'Accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Length': image.lengthSync().toString(),
      'Authorization': 'Bearer $token'
    };
  }

  Future<dynamic> get(context, {required String url}) async {
    Map<String, String> headers = await setHeaders();
    // current implementation does not take jsonEncode since
    // data is already encoded

    http.Response? response;


    try {
      response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 60));
    } on SocketException catch (_) {
      DialogUtils().httpNetworkExceptionDialog(context);
    } on TimeoutException catch (_) {
      DialogUtils().httpTimeOutDialog(context);
    } on Error catch (_) {
      DialogUtils().httpErrorDialog(context);
    }
    Loader.hide();
    return response;
  }

  Future<http.Response?> post(context,
      {required String url, dynamic data}) async {
    Map<String, String> headers = await setHeaders();

    // String encodedData = data == null ? "{}" : jsonEncode(data);
    http.Response? response;

    // print(headers);


    try {
      
      response = await http
          .post(Uri.parse(url), headers: headers, body: data)
          .timeout(const Duration(seconds: 60));
    } on SocketException catch (_) {
      DialogUtils().httpNetworkExceptionDialog(context);
    } on TimeoutException catch (_) {
      DialogUtils().httpTimeOutDialog(context);
    } on Error catch (_) {
      DialogUtils().httpErrorDialog(context);
    }
    Loader.hide();
    return response;
  }

  Future<dynamic> put(context, {required String url, dynamic data}) async {
    Map<String, String> headers = await setHeaders();

    String encodedData = data == null ? "{}" : jsonEncode(data);
    http.Response? response;

    try {
      response = await http
          .put(Uri.parse(url), headers: headers, body: encodedData)
          .timeout(const Duration(seconds: 60));
    } on SocketException catch (_) {
      DialogUtils().httpNetworkExceptionDialog(context);
    } on TimeoutException catch (_) {
      DialogUtils().httpTimeOutDialog(context);
    } on Error catch (_) {
      DialogUtils().httpErrorDialog(context);
    }
    Loader.hide();
    return response;
  }

  Future<dynamic> filePut(context,
      {required String url,
      required File image,
      required bool dismiss,
      dynamic mimeType}) async {
    Map<String, String> headers = await setFileHeaders(mimeType, image);

    http.Response? response;

    try {
      response = await http
          .put(
            Uri.parse(url),
            headers: headers,
            body: image.readAsBytesSync(),
          )
          .timeout(const Duration(seconds: 120));
    } on SocketException {
      DialogUtils().httpNetworkExceptionDialog(context);
    } on TimeoutException {
      DialogUtils().httpTimeOutDialog(context);
    } on Error {
      DialogUtils().httpErrorDialog(context);
    }
    //Loader.hide();
    return response;
  }
}
