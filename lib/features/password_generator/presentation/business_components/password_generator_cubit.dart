import 'dart:developer' as developer;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_password_generator/features/password_generator/domain/models/preference_model.dart';
import 'package:random_password_generator/features/password_generator/domain/usecases/password_generator_usecase.dart';

part 'password_generator_state.dart';

class PasswordGeneratorCubit extends Cubit<PasswordGeneratorState> {
  final PasswordGeneratorUseCase _useCase;

  PasswordGeneratorCubit({
    required PasswordGeneratorUseCase useCase,
  })  : _useCase = useCase,
        super(PasswordGeneratorState.initial());

  void generatePassword({required PreferenceModel preferences}) {
    try {
      emit(state.copyWith(cubitState: CubitState.loading));
      final passwords = _useCase.generatePassword(
        preferences: preferences,
      );
      emit(state.copyWith(cubitState: CubitState.success, passwords: passwords));
    } catch (exception) {
      developer.log(exception.toString());
      emit(state.copyWith(cubitState: CubitState.error, errorMessage: exception.toString()));
    }
  }

  void savePreferences({required PreferenceModel preferences}) async {
    try {
      emit(state.copyWith(cubitState: CubitState.loading));
      await _useCase.savePreferences(preferences: preferences);

      emit(state.copyWith(cubitState: CubitState.success, preferences: preferences));
    } catch (exception) {
      developer.log(exception.toString());
      emit(state.copyWith(cubitState: CubitState.error, errorMessage: exception.toString()));
    }
  }

  void loadPreferences() async {
    try {
      emit(state.copyWith(cubitState: CubitState.loading));
      final preferences = await _useCase.loadPreferences();
      emit(state.copyWith(cubitState: CubitState.success, preferences: preferences));
    } catch (exception) {
      developer.log(exception.toString());
      emit(state.copyWith(cubitState: CubitState.error, errorMessage: exception.toString()));
    }
  }
}
