import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static SharedPreferences? _sharedPrefs;

  static init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  static storeStringToDevice({
    required String tokenKey,
    required String tokenValue,
  }) {
    _sharedPrefs!.setString(tokenKey, tokenValue);
  }

  static getStringFromDevice({
    required String tokenKey,
  }) {
    return _sharedPrefs!.getString(tokenKey);
  }

  static storeBoolToDevice({
    required String tokenKey,
    required bool tokenValue,
  }) {
    _sharedPrefs!.setBool(tokenKey, tokenValue);
  }

  static bool? getBoolFromDevice({
    required String tokenKey,
  }) {
    return _sharedPrefs!.getBool(tokenKey);
  }

  static removeFromDevice({required String tokenKey}) {
    return _sharedPrefs!.remove(tokenKey);
  }
}
