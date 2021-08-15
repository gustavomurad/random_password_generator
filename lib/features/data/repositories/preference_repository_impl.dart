import 'package:random_password_generator/features/data/datasources/preference_datasource.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/domain/repositories/preference_repository.dart';

class PreferenceRepositoryImpl implements PreferenceRepository {
  final PreferenceDatasource _datasource;

  PreferenceRepositoryImpl({
    required PreferenceDatasource datasource,
  }) : this._datasource = datasource;

  @override
  Future<PasswordModel?> loadPreferences() async {
    final map = await this._datasource.loadPreferences();

    return map != null ? PasswordModel.fromJson(json: map) : null;
  }

  @override
  Future<bool> savePreferences({required PasswordModel passwordModel}) {
    return this._datasource.savePreferences(json: passwordModel.toJson());
  }
}
