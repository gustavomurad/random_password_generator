part of 'password_bloc.dart';

abstract class PasswordEvents {}

class GenerateNewPassword extends PasswordEvents {
  final PasswordModel _passwordModel;

  GenerateNewPassword({
    required PasswordModel passwordModel,
  }) : this._passwordModel = passwordModel;

  PasswordModel get passwordModel => this._passwordModel;
}

class SaveConfiguration extends PasswordEvents {
  final PasswordModel _passwordModel;

  SaveConfiguration({
    required PasswordModel passwordModel,
  }) : this._passwordModel = passwordModel;

  PasswordModel get passwordModel => this._passwordModel;
}

class LoadConfiguration extends PasswordEvents {}
