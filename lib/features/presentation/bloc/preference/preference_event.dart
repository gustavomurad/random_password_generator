part of 'preference_bloc.dart';

@immutable
abstract class PreferenceEvent {}

class SavePreferences extends PreferenceEvent {
  final PasswordModel _passwordModel;

  SavePreferences({
    required PasswordModel passwordModel,
  }) : this._passwordModel = passwordModel;

  PasswordModel get passwordModel => this._passwordModel;
}

class LoadPreferences extends PreferenceEvent {}
