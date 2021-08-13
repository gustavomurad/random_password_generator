import 'package:random_password_generator/features/domain/models/password_model.dart';

abstract class PreferenceRepository {
  Future<void> savePreferences({required PasswordModel passwordModel});

  Future<PasswordModel?> loadPreferences();
}
