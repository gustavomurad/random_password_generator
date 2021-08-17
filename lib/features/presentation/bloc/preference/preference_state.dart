part of 'preference_bloc.dart';

@immutable
abstract class PreferenceState {}

class PreferenceInitialState implements PreferenceState {}

class PreferenceSuccessState implements PreferenceState {
  final PasswordModel _passwordModel;

  PreferenceSuccessState({
    required PasswordModel passwordModel,
  }) : _passwordModel = passwordModel;

  PasswordModel get passwordModel => _passwordModel;

  List<bool> get toggleValues => [
        _passwordModel.lowercaseLetters,
        _passwordModel.uppercaseLetters,
        _passwordModel.numbers,
        _passwordModel.specialCharacters,
        _passwordModel.latin1Characters,
      ];
}

class PreferenceErrorState implements PreferenceState {}
