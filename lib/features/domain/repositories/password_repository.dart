import 'package:random_password_generator/features/domain/models/password_model.dart';

abstract class PasswordRepository {
  Future<List<String>> generatePassword({required PasswordModel passwordModel});

  Future<void> saveConfiguration({required PasswordModel passwordModel});

  Future<PasswordModel> loadConfiguration();
}
