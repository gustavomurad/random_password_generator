import 'package:random_password_generator/features/password_generator/domain/models/preference_model.dart';

abstract class PasswordGeneratorRepository {
  Future<List<String>> generatePassword({required PreferenceModel preferences});

  Future<bool> savePreferences({required PreferenceModel preferences});

  Future<PreferenceModel?> loadPreferences();
}
