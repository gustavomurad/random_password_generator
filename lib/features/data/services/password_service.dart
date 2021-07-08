import 'package:random_password_generator/features/domain/models/password_model.dart';

abstract class PasswordService {
  Future<String> generatePassword({required PasswordModel passwordModel});
}
