import 'dart:convert';

import 'package:emergency_alert/Model/Response/user_response.dart';
import 'package:emergency_alert/Services/Local/shared_prefs_manager.dart';
import 'package:emergency_alert/Utils/Dialogs/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
class ProfileProvider extends ChangeNotifier {
  final SharedPrefsManager _sharedPrefsManager = SharedPrefsManager();
  // final ProfileFactory _profileFactory = ProfileFactory();
  User? _currentUserProfile;
  User? get currentUserProfile => _currentUserProfile;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setCurrentUserProfile(User user) {
    _currentUserProfile = user;
    // print("setting current user to shared Prefs ${user.toJson()}");
    _sharedPrefsManager.setUser(user);
    notifyListeners();
  }

  resetUser(context) async {
    await getUser(context);
  }

  String getUserFullname() {
    String fullName = "";
    if (_currentUserProfile != null) {
      fullName =
          _currentUserProfile!.name;
    }
    return fullName;
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  getUser(context, {bool fromRemote = false}) async {
    User? user = await _sharedPrefsManager.getUser();
    // _loadingState = LoadingState.idle;

    if (user != null) {
      setCurrentUserProfile(user);
    }
    return user;
  }

  ProfileProvider(context) {
    loadCurrentProfile(context);
  }

  Future<User?> loadCurrentProfile(context) async {
    getUser(context);
    return null;
  }

  Future logout(context) async {
    await _sharedPrefsManager.logout();
    _currentUserProfile = null;
    notifyListeners();
  }

  Future updateProfile(context, User user) async {
    // LoaderUtils.showOverlay(context);
    // await _profileFactory.updateUser(context, user).then((user) {
    //   if (user != null) {
    //     setCurrentUserProfile(user);
    //     // DialogUtils.showNativeAlertDialog(context,
    //     //     message: "Successfully updated User Profile",
    //     //     title: "Update Complete");
    //   }
    // });
    Loader.hide();
  }

  Future<bool?> changePassword(context, String password, String newPassword,
      String confirmPassword, bool firstimer) async {
    bool? isFirstimer = null;
    if (newPassword != confirmPassword) {
      DialogUtils.showNativeAlertDialog(context,
          message: 'Password mis-match', title: 'Sorry');
    } else {
      setLoading(true);
      Map<String, dynamic> body = {
        "confirm_password": confirmPassword,
        "new_password": newPassword,
        "password": password
      };
      // await _profileFactory
      //     .changePassword(context, jsonEncode(body))
      //     .then((response) {
      //   setLoading(false);
      //   if (response['successful'] == true) {
      //     noti(message: response['message'], title: "Update Complete");
      //     if (firstimer) {
      //       isFirstimer = true;
      //       notifyListeners();
      //     } else {
      //       // Navigator.pop(context);
      //       isFirstimer = true;
      //       notifyListeners();
      //     }
      //   } else if (response['status'] == 401) {
      //     NotificationUtils.showToast(context, message: 'Logging out user');
      //   } else {
      //     // print("==========================${response}");
      //     DialogUtils.showNativeAlertDialog(
      //       context,
      //       message: response['message'],
      //       title: "An Error Occurred.",
      //     );
      //   }
      // });
    }
    return isFirstimer;
  }

  
}
