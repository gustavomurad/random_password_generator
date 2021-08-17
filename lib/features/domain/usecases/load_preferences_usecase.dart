import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/domain/repositories/preference_repository.dart';

class LoadPreferencesUsecase {
  final PreferenceRepository _repository;

  LoadPreferencesUsecase({
    required PreferenceRepository repository,
  }) : _repository = repository;

  Future<PasswordModel?> call() {
    return _repository.loadPreferences();
  }
}
