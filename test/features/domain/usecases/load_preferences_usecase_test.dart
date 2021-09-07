import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/domain/repositories/preference_repository.dart';
import 'package:random_password_generator/features/domain/usecases/load_preferences_usecase.dart';

import '../../../fixtures/fixture_reader.dart';

class PreferenceRepositoryMock extends Mock implements PreferenceRepository {}

main() {
  late PasswordModel passwordModel;
  late PreferenceRepository repository;

  setUpAll(() {
    repository = PreferenceRepositoryMock();

    passwordModel = PasswordModel.fromJson(
      json: jsonDecode(fixture('password_model.json')),
    );

    registerFallbackValue(passwordModel);
  });

  group('Tests on LoadPreferencesUsecase', () {
    test('test loadPreferences returning PasswordModel', () async {
      when(() => repository.loadPreferences()).thenAnswer(
        (_) async => passwordModel,
      );

      LoadPreferencesUsecase usecase = LoadPreferencesUsecase(
        repository: repository,
      );

      final PasswordModel? actual = await usecase();

      expect(actual, isNotNull);
      expect(actual, isA<PasswordModel>());
      expect(actual?.length, 20);
      expect(actual?.quantity, 5);
      expect(actual?.lowercaseLetters, true);
      expect(actual?.uppercaseLetters, true);
      expect(actual?.numbers, true);
      expect(actual?.specialCharacters, true);
      expect(actual?.latin1Characters, true);
    });

    test('test LoadPreferencesUsecase returning null', () async {
      when(() => repository.loadPreferences()).thenAnswer((_) async => null);

      LoadPreferencesUsecase usecase = LoadPreferencesUsecase(
        repository: repository,
      );

      final PasswordModel? actual = await usecase();

      expect(actual, isNull);
    });
  });
}
