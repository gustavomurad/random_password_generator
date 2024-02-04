part of 'password_generator_cubit.dart';

class PasswordGeneratorState extends Equatable {
  final CubitState cubitState;
  final List<String> passwords;
  final PreferenceModel preferences;
  final String? errorMessage;

  factory PasswordGeneratorState.initial() => const PasswordGeneratorState(
        cubitState: CubitState.initial,
        preferences: PreferenceModel(),
        passwords: <String>[],
      );

  const PasswordGeneratorState({
    required this.cubitState,
    required this.passwords,
    required this.preferences,
    this.errorMessage,
  });

  PasswordGeneratorState copyWith({
    CubitState? cubitState,
    List<String>? passwords,
    PreferenceModel? preferences,
    String? errorMessage,
  }) =>
      PasswordGeneratorState(
        cubitState: cubitState ?? this.cubitState,
        passwords: passwords ?? this.passwords,
        preferences: preferences ?? this.preferences,
        errorMessage: errorMessage,
      );

  @override
  List<Object?> get props => [cubitState, passwords, preferences, errorMessage];
}

enum CubitState {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == CubitState.initial;

  bool get isLoading => this == CubitState.loading;

  bool get isSuccess => this == CubitState.success;

  bool get isError => this == CubitState.error;
}
