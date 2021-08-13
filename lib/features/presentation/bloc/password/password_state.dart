part of 'password_bloc.dart';

@immutable
abstract class PasswordState {}

class PasswordInitialState implements PasswordState {}

class PasswordSuccessState implements PasswordState {
  final List<String> password;

  PasswordSuccessState({required this.password});
}

class PasswordErrorState implements PasswordState {
  final String errorMessage;

  PasswordErrorState({required this.errorMessage});
}
