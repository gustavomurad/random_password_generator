import 'package:random_password_generator/features/password_generator/data/repositories/password_generator_repository.dart';
import 'package:random_password_generator/features/password_generator/domain/models/preference_model.dart';
import 'package:random_password_generator/features/password_generator/domain/usecases/password_generator_usecase.dart';

class PasswordGeneratorUsecaseImpl implements PasswordGeneratorUsecase {
  final PasswordGeneratorRepository _repository;

  const PasswordGeneratorUsecaseImpl({
    required PasswordGeneratorRepository repository,
  }) : _repository = repository;

  @override
  Future<List<String>> generatePassword(
          {required PreferenceModel preferences}) =>
      _repository.generatePassword(preferences: preferences);

  @override
  Future<PreferenceModel?> loadPreferences() => _repository.loadPreferences();

  @override
  Future<bool> savePreferences({required PreferenceModel preferences}) =>
      _repository.savePreferences(preferences: preferences);
}
