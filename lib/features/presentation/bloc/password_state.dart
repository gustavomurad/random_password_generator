part of 'password_bloc.dart';

@immutable
abstract class PasswordState {}

class PasswordInitialState implements PasswordState {}

class PasswordSuccess implements PasswordState {
  final List<String> password;

  PasswordSuccess({required this.password});
}

class PasswordErrorState implements PasswordState {
  final String errorMessage;

  PasswordErrorState({required this.errorMessage});
}
