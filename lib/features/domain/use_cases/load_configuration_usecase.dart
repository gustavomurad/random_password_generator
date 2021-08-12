import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/domain/repositories/password_repository.dart';

class LoadConfigurationUsecase {
  final PasswordRepository _repository;

  LoadConfigurationUsecase({
    required PasswordRepository repository,
  }) : this._repository = repository;

  Future<PasswordModel> call() {
    return _repository.loadConfiguration();
  }
}
