import 'package:random_password_generator/features/data/services/password_service.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';

class GeneratePasswordUseCase {
  final PasswordService _service;

  GeneratePasswordUseCase({
    required PasswordService service,
  }) : this._service = service;

  Future<List<String>> call({required PasswordModel passwordModel}) {
    return _service.generatePassword(passwordModel: passwordModel);
  }
}
