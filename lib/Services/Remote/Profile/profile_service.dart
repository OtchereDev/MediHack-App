import 'dart:convert';

import 'package:emergency_alert/Core/Mixins/auth_base_repository.dart';
import 'package:emergency_alert/Core/Repositories/Profile/profile_repository.dart';
import 'package:emergency_alert/Core/app_constants.dart';

class ProfileService with AuthBaseRepository implements ProfileRepository {
  @override
  Future<Map<String, dynamic>> changePin(context, data) async {
    Map<String, dynamic> response = {'successful': false, 'message': ''};
    await put(context, url: "$kBaseUrl/referring-doctors/update-password", data: data).then((resp) {
      var decodedResp = json.decode(resp.body);
      if (decodedResp['status'] == 200) {
        response['successful'] = true;
      }
      response['message'] = decodedResp['message'];
    });
    return response;
  }

  @override
  Future<Map<String, dynamic>> checkPhone(context, dynamic data) async {
    Map<String, dynamic> response = {'successful': false, 'message': ''};
    await post(context, url: "$kBaseUrl/RESETPIN_ROUTE", data: data)
        .then((resp) {
      var decodedResp = json.decode(resp!.body);
      if (decodedResp['status'] == 200) {
        response['successful'] = true;
      }
      response['message'] = decodedResp['message'];
    });
    return response;
  }

  @override
  Future<Map<String, dynamic>> verifyForgotOtp(context, data) async {
    Map<String, dynamic> response = {'successful': false, 'message': ''};
    await post(context, url: "$kBaseUrl/VERIFYPIN_ROUTE", data: data)
        .then((resp) {
      var decodedResp = json.decode(resp!.body);
      if (decodedResp['status'] == 200) {
        response['successful'] = true;
      }
      response['message'] = decodedResp['message'];
    });
    return response;
  }

  @override
  Future changePassword(context, data) async {
    Map<String, dynamic> response = {'successful': false, 'message': '', 'status':100};
      // print("=====================$data====================");
    await post(context, url: "$kBaseUrl/referring-doctors/update-password", data: data)
        .then((resp) {
          // print(resp?.body);
      var decodedResp = json.decode(resp!.body);
      if (decodedResp['statusCode'] == 200) {
        response['successful'] = true;
        response['status'] = 200;
      }
      if(decodedResp['status'] == 401){
        response['status'] = 401;

      }
      response['message'] = decodedResp['message'];
    });
    return response;
  }

  @override
  Future forgotPassword(context, data) async {
    Map<String, dynamic> response = {'successful': false, 'message': ''};
    await post(context, url: "$kBaseUrl/RESETPIN_ROUTE", data: data)
        .then((resp) {
      var decodedResp = json.decode(resp!.body);
      if (decodedResp['status'] == 200) {
        response['successful'] = true;
      }
      response['message'] = decodedResp['message'];
    });
    return response;
  }


  Future replyChat(context, data) async {
  dynamic responseMap = {"status": false, "message": "", "data": null};

    await post(
      context,
      url: "$kBaseUrl/firstaid/chats",
      data: jsonEncode(data)
    ).then((response) {
      print(response?.body);

      if (response != null) {
        if (response.statusCode == 200) {
        var dataResponse = json.decode(response.body);
          responseMap['status'] = true;
          responseMap['message'] = dataResponse['message'];
          responseMap['data'] = json.decode(response.body);
        } else {
          responseMap['message'] = "Something went wrong";
          responseMap['data'] = null;
        }
      }
    });
    return responseMap;
  }

  
  @override
  Future getMyQuestions(context) {
    // TODO: implement getMyQuestions
    throw UnimplementedError();
  }
  
  @override
  Future getUserQuestions(context) {
    // TODO: implement getUserQuestions
    throw UnimplementedError();
  }
  
  @override
  Future setQuestions(context, data) {
    // TODO: implement setQuestions
    throw UnimplementedError();
  }
  
  @override
  Future verifyQuestion(context, data) {
    // TODO: implement verifyQuestion
    throw UnimplementedError();
  }

}
