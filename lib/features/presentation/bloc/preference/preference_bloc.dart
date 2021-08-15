import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_password_generator/core/logger/application_logger.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/domain/repositories/preference_repository.dart';
import 'package:random_password_generator/features/domain/usecases/load_preferences_usecase.dart';
import 'package:random_password_generator/features/domain/usecases/save_preferences_usecase.dart';

part 'preference_event.dart';

part 'preference_state.dart';

class PreferenceBloc extends Bloc<PreferenceEvent, PreferenceState> {
  final _logger = ApplicationLogger.logger;
  final PreferenceRepository _repository;

  PreferenceBloc({
    required PreferenceRepository repository,
  })  : this._repository = repository,
        super(PreferenceInitialState());

  @override
  Stream<PreferenceState> mapEventToState(PreferenceEvent event) async* {
    if (event is SavePreferences) {
      try {
        final usecase = SavePreferencesUsecase(repository: this._repository);

        await usecase(passwordModel: event.passwordModel);

        yield PreferenceSuccessState(passwordModel: event.passwordModel);
      } catch (e) {
        _logger.e(
          'SavePreferences event throws this error => ${e.toString()}',
        );

        yield PreferenceErrorState();
      }
    } else if (event is LoadPreferences) {
      try {
        final usecase = LoadPreferencesUsecase(repository: this._repository);

        final PasswordModel? model = await usecase();

        if (model != null) yield PreferenceSuccessState(passwordModel: model);
      } catch (e) {
        _logger.e(
          'LoadPreferences event throws this error => ${e.toString()}',
        );

        yield PreferenceErrorState();
      }
    }
  }
}
