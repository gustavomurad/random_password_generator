part of 'preference_bloc.dart';

@immutable
abstract class PreferenceState {}

class PreferenceInitialState implements PreferenceState {}

class PreferenceSuccessState implements PreferenceState {
  final PasswordModel _passwordModel;

  PreferenceSuccessState({
    required PasswordModel passwordModel,
  }) : this._passwordModel = passwordModel;

  PasswordModel get passwordModel => this._passwordModel;

  List<bool> get toggleValues => [
        this._passwordModel.lowercaseLetters,
        this._passwordModel.uppercaseLetters,
        this._passwordModel.numbers,
        this._passwordModel.specialCharacters,
        this._passwordModel.latin1Characters,
      ];
}

class PreferenceErrorState implements PreferenceState {}
