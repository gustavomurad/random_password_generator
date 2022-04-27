import 'dart:convert';

import 'package:random_password_generator/core/util/password.dart';
import 'package:random_password_generator/features/password_generator/data/repositories/password_generator_repository.dart';
import 'package:random_password_generator/features/password_generator/domain/models/preference_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordGeneratorRepositoryImpl implements PasswordGeneratorRepository {
  static const cachedConfiguration = 'configuration';

  const PasswordGeneratorRepositoryImpl();

  @override
  Future<List<String>> generatePassword({
    required PreferenceModel preferenceModel,
  }) {
    return Password.generate(
      length: preferenceModel.length,
      quantity: preferenceModel.quantity,
      includeLowercaseLetters: preferenceModel.lowercaseLetters,
      includeUppercaseLetters: preferenceModel.uppercaseLetters,
      includeNumbers: preferenceModel.numbers,
      includeSpecialCharacters: preferenceModel.specialCharacters,
      includeLatin1Characters: preferenceModel.latin1Characters,
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
  Future<bool> savePreferences({required PreferenceModel preferenceModel}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(
      cachedConfiguration,
      jsonEncode(preferenceModel.toJson()),
    );
  }
}
