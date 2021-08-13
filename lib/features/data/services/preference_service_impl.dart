import 'dart:convert';

import 'package:random_password_generator/core/util/password_shared_preferences.dart';
import 'package:random_password_generator/features/domain/services/preference_service.dart';

class PreferenceServiceImpl implements PreferenceService {
  @override
  Future<void> savePreferences({required Map<String, dynamic> json}) {
    return PasswordSharedPreferences.saveConfiguration(
      encodedJson: jsonEncode(json),
    );
  }

  @override
  Future<Map<String, dynamic>?> loadPreferences() async {
    final configuration = await PasswordSharedPreferences.loadConfiguration();

    return (configuration != null) ? jsonDecode(configuration) : null;
  }
}
