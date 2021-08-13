part of 'password_bloc.dart';

abstract class PasswordEvents {}

class GenerateNewPassword extends PasswordEvents {
  final PasswordModel _passwordModel;

  GenerateNewPassword({
    required PasswordModel passwordModel,
  }) : this._passwordModel = passwordModel;

  PasswordModel get passwordModel => this._passwordModel;
}
