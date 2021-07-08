
import 'package:random_password_generator/features/domain/models/password_model.dart';

abstract class PasswordEvents {}

class GenerateNewPassword extends PasswordEvents {
  final PasswordModel passwordModel;

  GenerateNewPassword({
    required this.passwordModel,
  });
}
