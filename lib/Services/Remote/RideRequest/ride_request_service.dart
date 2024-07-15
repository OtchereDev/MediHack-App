import 'dart:convert';

import 'package:emergency_alert/Core/Mixins/auth_base_repository.dart';
import 'package:emergency_alert/Core/app_constants.dart';


class RideRequestService with AuthBaseRepository{
   Future<dynamic> goOnline(context, data) async {
     dynamic responseMap = {"status": false, "message": "", "data": null};
    await post(
      context,
      url: CLOUDURL,
      data: jsonEncode(data),
    ).then((response) {
   if (response != null) {
        var dataResponse = json.decode(response.body);
        if (dataResponse['ok'] == true) {
          responseMap['status'] = true;
          responseMap['message'] = dataResponse['msg'];
          responseMap['data'] = dataResponse;
        }else{
          responseMap['message'] = dataResponse['msg'];
          responseMap['data'] = dataResponse;
        }
      }
    });
    return responseMap;
  }

   Future<dynamic> searchRide(context, data) async {
     dynamic responseMap = {"status": false, "message": "", "data": null};
    await post(
      context,
      url: CLOUDURL,
      data: jsonEncode(data),
    ).then((response) {
   if (response != null) {
        var dataResponse = json.decode(response.body);
        if (dataResponse['okay'] == true) {
          responseMap['status'] = true;
          responseMap['message'] = dataResponse['msg'];
          responseMap['data'] = dataResponse;
        }else{
          responseMap['message'] = dataResponse['msg'];
          responseMap['data'] = dataResponse;
        }
      }
    });
    return responseMap;
  }

   Future<dynamic> bookRide(context, data) async {
     dynamic responseMap = {"status": false, "message": "", "data": null};
    await post(
      context,
      url: CLOUDURL,
      data: jsonEncode(data),
    ).then((response) {
   if (response != null) {
        var dataResponse = json.decode(response.body);
        if (dataResponse['ok'] == true) {
          responseMap['status'] = true;
          responseMap['message'] = dataResponse['msg'];
          responseMap['data'] = dataResponse;
        }else{
          responseMap['message'] = dataResponse['msg'];
          responseMap['data'] = dataResponse;
        }
      }
    });
    return responseMap;
  }

   Future<dynamic> startTrip(context, data) async {
     dynamic responseMap = {"status": false, "message": "", "data": null};
    await post(
      context,
      url: CLOUDURL,
      data: jsonEncode(data),
    ).then((response) {
   if (response != null) {
        var dataResponse = json.decode(response.body);
        if (response.statusCode == 200) {
          responseMap['status'] = true;
          responseMap['message'] = dataResponse['msg'];
          responseMap['data'] = dataResponse;
        }else{
          responseMap['message'] = dataResponse['msg'];
          responseMap['data'] = dataResponse;
        }
      }
    });
    return responseMap;
  }
}