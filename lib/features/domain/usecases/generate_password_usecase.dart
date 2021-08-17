import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/domain/repositories/password_repository.dart';

class GeneratePasswordUsecase {
  final PasswordRepository _repository;

  GeneratePasswordUsecase({
    required PasswordRepository repository,
  }) : _repository = repository;

  Future<List<String>> call({required PasswordModel passwordModel}) {
    return _repository.generatePassword(passwordModel: passwordModel);
  }
}
