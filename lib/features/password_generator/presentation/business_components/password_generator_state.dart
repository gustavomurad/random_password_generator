part of 'password_generator_cubit.dart';

abstract class PasswordGeneratorState extends Equatable {
  const PasswordGeneratorState();

  @override
  List<Object> get props => [];
}

class PasswordGeneratorInitialState extends PasswordGeneratorState {
  const PasswordGeneratorInitialState();
}

class PasswordGeneratorLoadingState extends PasswordGeneratorState {
  const PasswordGeneratorLoadingState();
}

class PasswordGeneratorSuccessState extends PasswordGeneratorState {
  final List<String>? passwords;
  final PreferenceModel? preferences;

  const PasswordGeneratorSuccessState({
    this.passwords,
    this.preferences,
  });
}

class PasswordGeneratorErrorState extends PasswordGeneratorState {
  final String message;

  const PasswordGeneratorErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
