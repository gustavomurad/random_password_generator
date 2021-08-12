import 'package:random_password_generator/features/domain/models/password_model.dart';

abstract class PasswordService {
  Future<List<String>> generatePassword({required PasswordModel passwordModel});

  Future<void> saveConfiguration({required Map<String, dynamic> json});

  Future<Map<String, dynamic>> loadConfiguration();
}
