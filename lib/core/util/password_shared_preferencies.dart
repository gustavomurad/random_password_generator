import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class PasswordSharedPreferences {
  static Future<void> saveConfiguration({required String encodedJson}) async {
    final _preferences = await SharedPreferences.getInstance();
    _preferences.setString('configuration', encodedJson);
  }

  static Future<String> loadConfiguration() async {
    final _preferences = await SharedPreferences.getInstance();
    return Future.value(_preferences.getString('configuration'));
  }
}
