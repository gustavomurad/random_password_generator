import 'package:equatable/equatable.dart';

enum PageState { ready, success, error }

extension PageStateBoolean on PageState {
  bool get isReady => this == PageState.ready;

  bool get isSuccess => this == PageState.success;

  bool get hasError => this == PageState.error;
}

class PasswordState extends Equatable {
  final List<String> password;
  final PageState pageState;
  final String? errorMessage;

  PasswordState({
    required this.password,
    required this.pageState,
    this.errorMessage,
  });

  factory PasswordState.initial() => PasswordState(
        password: [],
        pageState: PageState.ready,
      );

  @override
  List<Object?> get props => [this.password, this.pageState];
}
