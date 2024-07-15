// import 'dart:convert';
// import 'package:collector_app/Model/user_model.dart';
import 'dart:convert';

import 'package:emergency_alert/Model/Response/epa_user_response.dart';
import 'package:emergency_alert/Model/Response/user_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManager {
  final String authToken = "auth_token";
  final String baseCurrency = "base_currency";
  final String getStarted = 'get_started';
  // final String user_id = "user_id";

//set data into shared preferences like this
  Future<void> setAuthToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(authToken, token);
  }

  Future<String> getCurrency() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(baseCurrency) ?? "";
  }

  Future<User?> getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var user = preferences.getString('user');
    if (user == null) {
      return null;
    }
    return User.fromJson(jsonDecode(user));
  }

  Future<String> getAuthToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? newToken;
    newToken = pref.getString(authToken) ?? "";
    return newToken;
  }

  getPushNotificationToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('pushNotificationToken');
    return token;
  }

  setPushNotificationToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('pushNotificationToken', token);
  }

  Future<bool> isAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phone = prefs.getString(authToken);
    if (phone != null) {
      return true;
    }
    return false;
  }

  shouldShowAppTutorials() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final result = preferences.getBool("show_tutorials_flag");
    if (result != null) {
      return result;
    } else {
      return true;
    }
  }

  setGetStarted(bool set) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var phone = prefs.setBool(getStarted, set);
    return phone;
  }

  Future<bool> getGetstarted() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final result = preferences.getBool(getStarted);
    return result ?? false;
  }

  setshouldShowAppTutorials(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool("show_tutorials_flag", value);
  }

  setUser(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('user', jsonEncode(user.toJson()));
  }

 

  setUserType(bool patient) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('isPatient', patient);
  }

  Future<bool> getUserType() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('isPatient') ?? false;
  }


  Future<void> logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
