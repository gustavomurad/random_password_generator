import 'package:random_password_generator/features/password_generator/domain/models/preference_model.dart';

abstract class PasswordGeneratorUsecase {
  Future<List<String>> generatePassword({required PreferenceModel preferenceModel});

  Future<bool> savePreferences({required PreferenceModel preferenceModel});

  Future<PreferenceModel?> loadPreferences();
}
