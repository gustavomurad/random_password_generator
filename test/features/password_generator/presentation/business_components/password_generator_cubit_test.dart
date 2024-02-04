import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:random_password_generator/features/password_generator/domain/models/preference_model.dart';
import 'package:random_password_generator/features/password_generator/domain/usecases/password_generator_usecase.dart';
import 'package:random_password_generator/features/password_generator/presentation/business_components/password_generator_cubit.dart';

import '../../../../fixtures/model_mocks.dart';
import 'password_generator_cubit_test.mocks.dart';

@GenerateMocks([], customMocks: [MockSpec<PasswordGeneratorUseCase>(as: #PasswordGeneratorUsecaseMock)])
void main() {
  final preferenceModel = ModelMocks.preferenceModel;
  final passwords = ModelMocks.passwordList;
  final useCase = PasswordGeneratorUsecaseMock();

  blocTest<PasswordGeneratorCubit, PasswordGeneratorState>(
    'Test Cubit when generatePassword is added',
    build: () {
      when(useCase.generatePassword(
        preferences: preferenceModel,
      )).thenAnswer((_) => passwords);

      return PasswordGeneratorCubit(useCase: useCase);
    },
    act: (cubit) => cubit.generatePassword(
      preferences: preferenceModel,
    ),
    skip: 1,
    expect: () => [isA<PasswordGeneratorState>()],
    verify: (cubit) {
      final passwordList = cubit.state.passwords;
      final preferences = cubit.state.preferences;

      expect(passwordList, isNotNull);
      expect(passwordList, isNotEmpty);
      expect(passwordList.length, 3);
      expect(passwordList.first, isNotEmpty);
      expect(passwordList.first.length, 20);

      expect(preferences, isNotNull);
    },
  );

  blocTest<PasswordGeneratorCubit, PasswordGeneratorState>(
    'Test Cubit when authenticateWithEmail receive an Exception',
    build: () {
      when(useCase.generatePassword(preferences: preferenceModel)).thenThrow(Exception('test exception'));

      return PasswordGeneratorCubit(useCase: useCase);
    },
    act: (cubit) => cubit.generatePassword(preferences: preferenceModel),
    skip: 1,
    expect: () => [isA<PasswordGeneratorState>()],
    verify: (cubit) {
      expect(cubit.state.errorMessage, isNotNull);
      expect(cubit.state.errorMessage, isNotEmpty);
      expect(cubit.state.errorMessage, 'Exception: test exception');
    },
  );

  blocTest<PasswordGeneratorCubit, PasswordGeneratorState>(
    'Test Cubit when savePreferences is added',
    build: () {
      when(useCase.savePreferences(
        preferences: preferenceModel,
      )).thenAnswer((_) async => true);

      return PasswordGeneratorCubit(useCase: useCase);
    },
    act: (cubit) => cubit.savePreferences(
      preferences: preferenceModel,
    ),
    skip: 1,
    expect: () => [isA<PasswordGeneratorState>()],
    verify: (cubit) {
      final passwordList = cubit.state.passwords;
      final preferences = cubit.state.preferences;

      expect(passwordList, isNotNull);
      expect(passwordList, isEmpty);
      expect(preferences, isNotNull);
    },
  );

  blocTest<PasswordGeneratorCubit, PasswordGeneratorState>(
    'Test Cubit when savePreferences receive an Exception',
    build: () {
      when(useCase.savePreferences(preferences: preferenceModel)).thenThrow(Exception('test exception'));

      return PasswordGeneratorCubit(useCase: useCase);
    },
    act: (cubit) => cubit.savePreferences(preferences: preferenceModel),
    skip: 1,
    expect: () => [isA<PasswordGeneratorState>()],
    verify: (cubit) {
      expect(cubit.state.errorMessage, isNotNull);
      expect(cubit.state.errorMessage, isNotEmpty);
      expect(cubit.state.errorMessage, 'Exception: test exception');
    },
  );

  blocTest<PasswordGeneratorCubit, PasswordGeneratorState>(
    'Test Cubit when loadPreferences is added',
    build: () {
      when(useCase.loadPreferences()).thenAnswer((_) async => preferenceModel);

      return PasswordGeneratorCubit(useCase: useCase);
    },
    act: (cubit) => cubit.loadPreferences(),
    skip: 1,
    expect: () => [isA<PasswordGeneratorState>()],
    verify: (cubit) {
      final passwordList = cubit.state.passwords;
      final preferences = cubit.state.preferences;

      expect(passwordList, isNotNull);
      expect(preferences, isA<PreferenceModel>());
    },
  );

  blocTest<PasswordGeneratorCubit, PasswordGeneratorState>(
    'Test Cubit when loadPreferences receive an Exception',
    build: () {
      when(useCase.loadPreferences()).thenThrow(Exception('test exception'));

      return PasswordGeneratorCubit(useCase: useCase);
    },
    act: (cubit) => cubit.loadPreferences(),
    skip: 1,
    expect: () => [isA<PasswordGeneratorState>()],
    verify: (cubit) {
      expect(cubit.state.errorMessage, isNotNull);
      expect(cubit.state.errorMessage, isNotEmpty);
      expect(cubit.state.errorMessage, 'Exception: test exception');
    },
  );
}
