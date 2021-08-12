import 'dart:convert';

import 'package:random_password_generator/core/util/password.dart';
import 'package:random_password_generator/core/util/password_shared_preferencies.dart';
import 'package:random_password_generator/features/domain/services/password_service.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';

class PasswordServiceImpl implements PasswordService {
  @override
  Future<List<String>> generatePassword({
    required PasswordModel passwordModel,
  }) async {
    return Password.generate(
      length: passwordModel.length,
      quantity: passwordModel.quantity,
      includeLowercaseLetters: passwordModel.lowercaseLetters,
      includeUppercaseLetters: passwordModel.uppercaseLetters,
      includeNumbers: passwordModel.numbers,
      includeSpecialCharacters: passwordModel.specialCharacters,
      includeLatin1Characters: passwordModel.latin1Characters,
    );
  }

  @override
  Future<void> saveConfiguration({required Map<String, dynamic> json}) {
    return PasswordSharedPreferences.saveConfiguration(
      encodedJson: jsonEncode(json),
    );
  }

  @override
  Future<Map<String, dynamic>> loadConfiguration() async {
    return jsonDecode(
      await PasswordSharedPreferences.loadConfiguration(),
    );
  }
}
