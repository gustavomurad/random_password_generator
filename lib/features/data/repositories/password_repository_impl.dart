import 'package:random_password_generator/features/domain/services/password_service.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/domain/repositories/password_repository.dart';

class PasswordRepositoryImpl implements PasswordRepository {
  final PasswordService _service;

  PasswordRepositoryImpl({
    required PasswordService service,
  }) : this._service = service;

  @override
  Future<List<String>> generatePassword({
    required PasswordModel passwordModel,
  }) {
    return this._service.generatePassword(passwordModel: passwordModel);
  }

  @override
  Future<void> saveConfiguration({
    required PasswordModel passwordModel,
  }) {
    return this._service.saveConfiguration(json: passwordModel.toJson());
  }

  @override
  Future<PasswordModel> loadConfiguration() async {
    return PasswordModel.fromJson(
      json: await this._service.loadConfiguration(),
    );
  }
}
