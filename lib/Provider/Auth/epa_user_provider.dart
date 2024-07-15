import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Component/custom_toast.dart';
import 'package:emergency_alert/Model/Response/epa_user_response.dart';
import 'package:emergency_alert/Services/Local/shared_prefs_manager.dart';
import 'package:emergency_alert/Services/Remote/Authentication/auth_remote_service.dart';
import 'package:emergency_alert/Utils/Dialogs/dialog_utils.dart';
import 'package:flutter/material.dart';

class EPAUserAuthProvider extends ChangeNotifier {
  AuthRemoteService authService = AuthRemoteService();
  final SharedPrefsManager _sharedPrefsManager = SharedPrefsManager();
  bool _loadPage = false;
  bool get loadPage => _loadPage;

  setLoadingPage(bool value) {
    _loadPage = value;
    notifyListeners();
  }

  verifyPin(context, String pin) async {
    await authService.verifyPin(
      context,
      {"passcode": pin},
    ).then((value) {
      setLoadingPage(false);
      if (value['status'] == true) {
      } else {
        customDailog(
            isSuccess: false,
            message: 'Verification failed',
            title: 'Failed',
            icon: Icon(Icons.warning_amber));
      }
    });
  }

  Future<bool?> performLogin(context,
      {required String email, required String password}) async {
    setLoadingPage(true);
    bool? actionSuccessful = false;
    Map<String, dynamic> data = {"email": email, "password": password};
    await authService.epasignin(context, data).then((response) async {
      if (response['status'] == true) {
        await _sharedPrefsManager
            .setAuthToken(response['data']['access_token']);
        await _sharedPrefsManager
            .setUser(User.fromJson(response['data']['user']));
        actionSuccessful = true;
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                  child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppSpaces.height16,
                    const Text(
                      "Login Failed",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    AppSpaces.height8,
                    Text("${response['message'].toString()} 🚫"),
                    AppSpaces.height8,
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: TextButton(
                            child: const Text(
                              "Try again",
                              style: TextStyle(color: AppColors.PRIMARYCOLOR),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                    )
                  ],
                ),
              ));
            });
      }
    });
    setLoadingPage(false);
    return actionSuccessful;
  }

  Future<bool> signUp(
      context, String name, String email, String password) async {
    setLoadingPage(true);
    Map<String, dynamic> data = {
      "email": email,
      "name": name,
      "password": password
    };
    await authService.signup(context, data).then((value) {
      setLoadingPage(false);
      if (value['status'] == true) {
        customDailog(
            isSuccess: true,
            message: value['data']['message'].toString(),
            title: 'Successful',
            icon: Icon(Icons.warning_amber));
      } else {
        // NotificationUtils.showToast(context, message: value['message']);
        customDailog(
            isSuccess: false,
            message: value['data']['message'].toString(),
            title: 'Failed',
            icon: Icon(Icons.warning_amber));
      }
    });
    return false;
  }

  Future<bool?> sendOtp(context, {required String? email}) async {
    bool actionSuccessful = false;
    setLoadingPage(true);
    await authService.sendOtp(context, {'email': email!}).then((response) {
      setLoadingPage(false);
      if (response != null) {
        if (response['status'] == true) {
          actionSuccessful = true;
          customDailog(
              isSuccess: true,
              message: response['data']['message'].toString(),
              title: 'Successful',
              icon: Icon(Icons.warning_amber));
        } else {
          DialogUtils.showNativeAlertDialog(context,
              title: "An error Occurred",
              message: response['message'].toString());
        }
      }
    });
    return actionSuccessful;
  }

  // Future<bool?> verifyOtp(context,
  //     {required String phone, required String code}) async {
  //   bool? actionSuccessful;
  //   Map<String, dynamic> data = {
  //     "phone_number": phone,
  //     "phone_verification_code": code
  //   };
  //   // LoaderUtils.showOverlay(context);

  //   await authService.verifyOtp(context, data).then((response) async {
  //     print(response);
  //     if (response != null) {
  //       // session expired
  //       if (response['status'] == false) {
  //         return false;
  //       }
  //       if (response['status'] == true) {
  //         // AppNavigationHelper.setRootOldWidget(context, LoginScreen());
  //         // subscribePushNotification(context);
  //         actionSuccessful = true;
  //       } else {
  //         // DialogUtils.showNativeAlertDialog(context,
  //         //     title: "An error Occurred",
  //         //     message: response['data']['message'].toString());
  //       }
  //     }
  //     setLoadingState(LoadingState.idle);
  //     return actionSuccessful;
  //   });
  //   return null;
  // }

  // checkPhone(context, dynamic data) async {
  //   setLoadingState(LoadingState.busy);
  //   await authService.setPin(context, data).then((response) {
  //     setLoadingState(LoadingState.idle);
  //     if (response['status'] == true) {
  //       // AppNavigationHelper.navigateToWidget(
  //       //     context, ForgotPassVerifyScreen(phoneNumber: data['phone']));
  //     } else {
  //       // DialogUtils.showNativeAlertDialog(context,
  //       //     title: "Sorry", message: response['message'].toString());
  //     }
  //   });
  //   setLoadingState(LoadingState.idle);
  // }

  Future<bool> verifyForgotOtp(
      context, String code, String password, String email) async {
    bool isSuccess = false;
    Map<String, dynamic> body = {
      "email": email,
      "code": code,
      "password": password
    };
    setLoadingPage(true);
    await authService.resetPassword(context, body).then((value) async {
      setLoadingPage(false);
      if (value['status'] == true) {
        isSuccess = true;
        customDailog(
            isSuccess: true, title: 'Success', message: value['message']);
      } else {
        customDailog(
            isSuccess: false, title: 'Failed', message: value['message']);
      }
    });

    return isSuccess;
  }

  subscribePushNotification(context) async {
    String deviceToken = await SharedPrefsManager().getPushNotificationToken();
    Map<String, dynamic> body = {"handle": deviceToken};
    await authService.subscribePushNotification(context, body);
  }

  testNotification(context) async {
    authService.testPushNotification(context, "data");
  }
}
