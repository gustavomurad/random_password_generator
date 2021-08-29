import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/domain/repositories/preference_repository.dart';

class SavePreferencesUsecase {
  final PreferenceRepository _repository;

  SavePreferencesUsecase({
    required PreferenceRepository repository,
  }) : _repository = repository;

  Future<bool> call({required PasswordModel passwordModel}) {
    return _repository.savePreferences(passwordModel: passwordModel);
  }
}
