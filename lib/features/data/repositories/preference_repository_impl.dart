import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/domain/repositories/preference_repository.dart';
import 'package:random_password_generator/features/domain/services/preference_service.dart';

class PreferenceRepositoryImpl implements PreferenceRepository {
  final PreferenceService _service;

  PreferenceRepositoryImpl({
    required PreferenceService service,
  }) : this._service = service;

  @override
  Future<PasswordModel?> loadPreferences() async {
    final map = await this._service.loadPreferences();

    return map != null ? PasswordModel.fromJson(json: map) : null;
  }

  @override
  Future<void> savePreferences({required PasswordModel passwordModel}) {
    return this._service.savePreferences(json: passwordModel.toJson());
  }
}
