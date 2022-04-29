import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:random_password_generator/features/password_generator/domain/models/preference_model.dart';
import 'package:random_password_generator/features/password_generator/domain/usecases/password_generator_usecase.dart';
import 'package:random_password_generator/features/password_generator/presentation/business_components/password_generator_cubit.dart';

import '../../../../fixtures/model_mocks.dart';
import 'password_generator_cubit_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<PasswordGeneratorUsecase>(as: #PasswordGeneratorUsecaseMock)
])
void main() {
  final preferenceModel = ModelMocks.preferenceModel;
  final passwords = ModelMocks.passwordList;
  final usecase = PasswordGeneratorUsecaseMock();

  blocTest<PasswordGeneratorCubit, PasswordGeneratorState>(
    'Test Cubit when generatePassword is added',
    build: () {
      when(usecase.generatePassword(
        preferences: preferenceModel,
      )).thenAnswer((_) async => passwords);

      return PasswordGeneratorCubit(usecase: usecase);
    },
    act: (cubit) => cubit.generatePassword(
      preferenceModel: preferenceModel,
    ),
    expect: () => [
      isA<PasswordGeneratorLoadingState>(),
      isA<PasswordGeneratorSuccessState>(),
    ],
    verify: (cubit) {
      final state = (cubit.state as PasswordGeneratorSuccessState);
      final passwordList = state.passwords;
      final preferences = state.preferences;

      expect(passwordList, isNotNull);
      expect(passwordList, isNotEmpty);
      expect(passwordList?.length, 3);
      expect(passwordList?[0], isNotEmpty);
      expect(passwordList?[0].length, 20);

      expect(preferences, isNull);
    },
  );

  blocTest<PasswordGeneratorCubit, PasswordGeneratorState>(
    'Test Cubit when authenticateWithEmail receive an Exception',
    build: () {
      when(usecase.generatePassword(preferences: preferenceModel))
          .thenThrow(Exception('test exception'));

      return PasswordGeneratorCubit(usecase: usecase);
    },
    act: (cubit) => cubit.generatePassword(preferenceModel: preferenceModel),
    expect: () => [
      isA<PasswordGeneratorLoadingState>(),
      isA<PasswordGeneratorErrorState>(),
    ],
    verify: (cubit) {
      final message = (cubit.state as PasswordGeneratorErrorState).message;
      expect(message, 'Exception: test exception');
    },
  );

  blocTest<PasswordGeneratorCubit, PasswordGeneratorState>(
    'Test Cubit when savePreferences is added',
    build: () {
      when(usecase.savePreferences(
        preferences: preferenceModel,
      )).thenAnswer((_) async => true);

      return PasswordGeneratorCubit(usecase: usecase);
    },
    act: (cubit) => cubit.savePreferences(
      preferenceModel: preferenceModel,
    ),
    expect: () => [
      isA<PasswordGeneratorLoadingState>(),
      isA<PasswordGeneratorSuccessState>(),
    ],
    verify: (cubit) {
      final state = (cubit.state as PasswordGeneratorSuccessState);
      final passwordList = state.passwords;
      final preferences = state.preferences;

      expect(passwordList, isNull);

      expect(preferences, isNull);
    },
  );

  blocTest<PasswordGeneratorCubit, PasswordGeneratorState>(
    'Test Cubit when savePreferences receive an Exception',
    build: () {
      when(usecase.savePreferences(preferences: preferenceModel))
          .thenThrow(Exception('test exception'));

      return PasswordGeneratorCubit(usecase: usecase);
    },
    act: (cubit) => cubit.savePreferences(preferenceModel: preferenceModel),
    expect: () => [
      isA<PasswordGeneratorLoadingState>(),
      isA<PasswordGeneratorErrorState>(),
    ],
    verify: (cubit) {
      final message = (cubit.state as PasswordGeneratorErrorState).message;
      expect(message, 'Exception: test exception');
    },
  );

  blocTest<PasswordGeneratorCubit, PasswordGeneratorState>(
    'Test Cubit when loadPreferences is added',
    build: () {
      when(usecase.loadPreferences()).thenAnswer((_) async => preferenceModel);

      return PasswordGeneratorCubit(usecase: usecase);
    },
    act: (cubit) => cubit.loadPreferences(),
    expect: () => [
      isA<PasswordGeneratorLoadingState>(),
      isA<PasswordGeneratorSuccessState>(),
    ],
    verify: (cubit) {
      final state = (cubit.state as PasswordGeneratorSuccessState);
      final passwordList = state.passwords;
      final preferences = state.preferences;

      expect(passwordList, isNull);

      expect(preferences, isNotNull);
      expect(preferences, isA<PreferenceModel>());
    },
  );

  blocTest<PasswordGeneratorCubit, PasswordGeneratorState>(
    'Test Cubit when loadPreferences receive an Exception',
    build: () {
      when(usecase.loadPreferences()).thenThrow(Exception('test exception'));

      return PasswordGeneratorCubit(usecase: usecase);
    },
    act: (cubit) => cubit.loadPreferences(),
    expect: () => [
      isA<PasswordGeneratorLoadingState>(),
      isA<PasswordGeneratorErrorState>(),
    ],
    verify: (cubit) {
      final message = (cubit.state as PasswordGeneratorErrorState).message;
      expect(message, 'Exception: test exception');
    },
  );
}
