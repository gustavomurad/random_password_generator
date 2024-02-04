import 'dart:convert';

import 'package:random_password_generator/core/util/password.dart';
import 'package:random_password_generator/features/password_generator/data/repositories/password_generator_repository.dart';
import 'package:random_password_generator/features/password_generator/domain/models/preference_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordGeneratorRepositoryImpl implements PasswordGeneratorRepository {
  static const cachedConfiguration = 'configuration';

  const PasswordGeneratorRepositoryImpl();

  @override
  List<String> generatePassword({
    required PreferenceModel preferences,
  }) {
    return Password.generate(
      length: preferences.length,
      quantity: preferences.quantity,
      includeLowercaseLetters: preferences.lowercaseLetters,
      includeUppercaseLetters: preferences.uppercaseLetters,
      includeNumbers: preferences.numbers,
      includeSpecialCharacters: preferences.specialCharacters,
      includeLatin1Characters: preferences.latin1Characters,
    );
  }

  @override
  Future<PreferenceModel?> loadPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final configuration = sharedPreferences.getString(cachedConfiguration);
    return (configuration != null)
        ? PreferenceModel.fromJson(
            json: jsonDecode(configuration),
          )
        : null;
  }

  @override
  Future<bool> savePreferences({required PreferenceModel preferences}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(
      cachedConfiguration,
      jsonEncode(preferences.toJson()),
    );
  }
}
