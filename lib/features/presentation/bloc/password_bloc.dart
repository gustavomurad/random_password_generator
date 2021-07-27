import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_password_generator/features/data/services/password_service_impl.dart';
import 'package:random_password_generator/features/domain/usecases/generate_password_usecase.dart';
import 'package:random_password_generator/features/presentation/bloc/password_events.dart';
import 'package:random_password_generator/features/presentation/bloc/password_state.dart';

class PasswordBloc extends Bloc<PasswordEvents, PasswordState> {
  PasswordBloc() : super(PasswordState.initial());

  @override
  Stream<PasswordState> mapEventToState(PasswordEvents event) async* {
    if (event is GenerateNewPassword) {
      try {
        final GeneratePasswordUseCase useCase = GeneratePasswordUseCase(
          service: PasswordServiceImpl(),
        );

        yield PasswordState(
          password: await useCase(passwordModel: event.passwordModel),
          pageState: PageState.success,
        );
      } catch (e) {
        yield PasswordState(
            password: [],
            pageState: PageState.error,
            errorMessage: (e is ArgumentError)
                ? e.message
                : 'Error on password generation!');
      }
    }
  }
}
