import 'dart:convert';

import 'package:random_password_generator/features/data/datasources/preference_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedConfiguration = 'configuration';

class PreferenceDatasourceImpl implements PreferenceDatasource {
  final SharedPreferences _preferences;

  PreferenceDatasourceImpl({
    required SharedPreferences preferences,
  }) : _preferences = preferences;

  @override
  Future<bool> savePreferences({required Map<String, dynamic> json}) async {
    return _preferences.setString(cachedConfiguration, jsonEncode(json));
  }

  @override
  Future<Map<String, dynamic>?> loadPreferences() {
    final configuration = _preferences.getString(cachedConfiguration);
    return (configuration != null) ? jsonDecode(configuration) : null;
  }
}
