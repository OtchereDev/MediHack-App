import 'package:flutter/foundation.dart';

class UtilPovider extends ChangeNotifier{
  String _countryCode = "GH";
  String get countryCode => _countryCode;

  String _numberCode ="233";
  String get numberCode => _numberCode;


  setCountry(String c){
    _countryCode = c;
    notifyListeners();
  }

  setCountryNumber(String number){
    _numberCode = number;
    notifyListeners();
  }
}