import 'dart:convert';

import 'package:emergency_alert/Core/Mixins/auth_base_repository.dart';
import 'package:emergency_alert/Core/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class CityRemoteService with AuthBaseRepository {
  final uuid = const Uuid();
  String? sessionToken;

   Future<List<dynamic>> getSuggestion(String input) async {
    List<dynamic> predictions = [];
    sessionToken ??= uuid.v4();

    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$kGoogleApiKey&sessiontoken=$sessionToken';
    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
    //  print (response.body);
      predictions = json.decode(response.body)['predictions'];
    } else {
      throw Exception('Failed to load predictions');
    }
    return predictions;
  }

  Future<List<dynamic>> getPlaceDetails(String id) async {
    sessionToken ??= uuid.v4();
    String baseURL = 'https://maps.googleapis.com/maps/api/place/details/json';
    String request =
        '$baseURL?place_id=$id&key=$kGoogleApiKey&sessiontoken=$sessionToken&fields=address_components';
    var response = await http.get(Uri.parse(request));
    final result = json.decode(response.body);
    return result['result']['address_components'];
  }
}
