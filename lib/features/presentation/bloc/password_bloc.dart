import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/domain/repositories/password_repository.dart';
import 'package:random_password_generator/features/domain/use_cases/generate_password_use_case.dart';

part 'password_events.dart';

part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvents, PasswordState> {
  final PasswordRepository _repository;

  PasswordBloc({
    required PasswordRepository repository,
  })  : this._repository = repository,
        super(PasswordInitialState());

  @override
  Stream<PasswordState> mapEventToState(PasswordEvents event) async* {
    if (event is GenerateNewPassword) {
      try {
        final GeneratePasswordUseCase useCase = GeneratePasswordUseCase(
          repository: this._repository,
        );

        yield PasswordSuccess(
          password: await useCase(passwordModel: event.passwordModel),
        );
      } catch (e) {
        final message =
            (e is ArgumentError) ? e.message : 'Error on password generation!';

        yield PasswordErrorState(errorMessage: message);
      }
    }
  }
}
