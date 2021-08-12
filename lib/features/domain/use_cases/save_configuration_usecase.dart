import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/domain/repositories/password_repository.dart';

class SaveConfigurationUsecase{
  final PasswordRepository _repository;

  SaveConfigurationUsecase({
    required PasswordRepository repository,
  }) : this._repository = repository;

  Future<void> call({required PasswordModel passwordModel}) {
    return _repository.saveConfiguration(passwordModel: passwordModel);
  }
}