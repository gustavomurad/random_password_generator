import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/domain/repositories/password_repository.dart';
import 'package:random_password_generator/features/domain/services/password_service.dart';

class PasswordRepositoryImpl implements PasswordRepository {
  final PasswordService _service;

  PasswordRepositoryImpl({
    required PasswordService service,
  }) : _service = service;

  @override
  Future<List<String>> generatePassword({
    required PasswordModel passwordModel,
  }) {
    return _service.generatePassword(passwordModel: passwordModel);
  }
}
