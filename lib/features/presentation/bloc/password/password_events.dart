part of 'password_bloc.dart';

abstract class PasswordEvents {}

class GenerateNewPassword extends PasswordEvents {
  final PasswordModel _passwordModel;

  GenerateNewPassword({
    required PasswordModel passwordModel,
  }) : _passwordModel = passwordModel;

  PasswordModel get passwordModel => _passwordModel;
}
