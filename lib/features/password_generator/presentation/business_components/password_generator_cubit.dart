import 'dart:developer' as developer;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_password_generator/features/password_generator/domain/models/preference_model.dart';
import 'package:random_password_generator/features/password_generator/domain/usecases/password_generator_usecase.dart';

part 'password_generator_state.dart';

class PasswordGeneratorCubit extends Cubit<PasswordGeneratorState> {
  final PasswordGeneratorUsecase _usecase;

  PasswordGeneratorCubit({
    required PasswordGeneratorUsecase usecase,
  })  : _usecase = usecase,
        super(const PasswordGeneratorInitialState());

  void generatePassword({required PreferenceModel preferenceModel}) async {
    try {
      emit(const PasswordGeneratorLoadingState());
      final passwords = await _usecase.generatePassword(
        preferenceModel: preferenceModel,
      );
      emit(PasswordGeneratorSuccessState(passwords: passwords));
    } catch (exception) {
      developer.log(exception.toString());
      emit(PasswordGeneratorErrorState(message: exception.toString()));
    }
  }

  void savePreferences({required PreferenceModel preferenceModel}) async {
    try {
      emit(const PasswordGeneratorLoadingState());
      await _usecase.savePreferences(preferenceModel: preferenceModel);

      emit(PasswordGeneratorSuccessState());
    } catch (exception) {
      developer.log(exception.toString());
      emit(PasswordGeneratorErrorState(message: exception.toString()));
    }
  }

  void loadPreferences() async {
    try {
      emit(const PasswordGeneratorLoadingState());
      final preferences = await _usecase.loadPreferences();
      emit(PasswordGeneratorSuccessState(preferences: preferences));
    } catch (exception) {
      developer.log(exception.toString());
      emit(PasswordGeneratorErrorState(message: exception.toString()));
    }
  }
}
