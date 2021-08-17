import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_password_generator/core/logger/application_logger.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/domain/repositories/password_repository.dart';
import 'package:random_password_generator/features/domain/usecases/generate_password_usecase.dart';

part 'password_events.dart';

part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvents, PasswordState> {
  final _logger = ApplicationLogger.logger;
  final PasswordRepository _repository;

  PasswordBloc({
    required PasswordRepository repository,
  })  : _repository = repository,
        super(PasswordInitialState());

  @override
  Stream<PasswordState> mapEventToState(PasswordEvents event) async* {
    if (event is GenerateNewPassword) {
      try {
        final GeneratePasswordUsecase useCase = GeneratePasswordUsecase(
          repository: _repository,
        );

        yield PasswordSuccessState(
          password: await useCase(passwordModel: event.passwordModel),
        );
      } catch (e) {
        _logger.e(
          'GenerateNewPassword event throws this error => ${e.toString()}',
        );
        final message =
            (e is ArgumentError) ? e.message : 'Error on password generation!';

        yield PasswordErrorState(errorMessage: message);
      }
    }
  }
}
