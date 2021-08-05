import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/domain/repositories/password_repository.dart';

class GeneratePasswordUseCase {
  final PasswordRepository _repository;

  GeneratePasswordUseCase({
    required PasswordRepository repository,
  }) : this._repository = repository;

  Future<List<String>> call({required PasswordModel passwordModel}) {
    return _repository.generatePassword(passwordModel: passwordModel);
  }
}
