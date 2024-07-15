
import 'package:emergency_alert/Component/custom_toast.dart';
import 'package:emergency_alert/Model/Response/emergecncy_contact.dart';
import 'package:emergency_alert/Model/Response/epa_user_response.dart';
import 'package:emergency_alert/Services/Local/shared_prefs_manager.dart';
import 'package:emergency_alert/Services/Remote/LocationService/location_service.dart';
import 'package:emergency_alert/Services/Remote/Profile/profile_service.dart';
import 'package:emergency_alert/Utils/Dialogs/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class ProfileProvider extends ChangeNotifier {
  final SharedPrefsManager _sharedPrefsManager = SharedPrefsManager();
  User? _currentUserProfile;
  User? get currentUserProfile => _currentUserProfile;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final _cityService = CityRemoteService();
  final _profileFactory = ProfileService();

    bool _isLoadingLocation = false;
  bool get isLoadingLocation => _isLoadingLocation;

  EmergencyContactResponse _emergencyContactResponse =
      EmergencyContactResponse();
  EmergencyContactResponse get emergencyContact => _emergencyContactResponse;

  List<dynamic> _suggestions = [];
  List<dynamic> get suggestions => _suggestions;

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
      fullName = _currentUserProfile!.name!;
    }
    return fullName;
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setLoadingLocation(bool loading) {
    _isLoadingLocation = loading;
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

  Future<bool?> addConact(
      context, String name, String location, String phone) async {
    bool? isSuccess = false;

    setLoading(true);
    Map<String, dynamic> body = {
      "name": name,
      "phone": "+$phone",
      "address": location
    };
    print(body);
    await _profileFactory.addContact(context, (body)).then((response) {
      print(response);
      setLoading(false);
      if (response['status'] == true) {
          isSuccess = true;
        customDailog(
            isSuccess: true,
            message: response['data']['message'].toString(),
            title: 'Successful',
            icon: Icon(Icons.warning_amber));
      } else {
      
        notifyListeners();
        DialogUtils.showNativeAlertDialog(
          context,
          message: response['message'].toString(),
          title: "An Error Occurred.",
        );
      }
    });

    return isSuccess;
  }

  fetchSuggestions(String query) async {
    setLoadingLocation(true);
    _suggestions = await _cityService.getSuggestion(query);
    // print(_suggestions);
    setLoadingLocation(false);
  }

  getMyContact(context) async {
    setLoading(true);
    await _profileFactory.getContact(context).then((res) {
      setLoading(false);
      // print(res);
      if (res["status"] == true) {
        _emergencyContactResponse =
            EmergencyContactResponse.fromJson(res['data']);
            notifyListeners();
      }
    });
  }
}
