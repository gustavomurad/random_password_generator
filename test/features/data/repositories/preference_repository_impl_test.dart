import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_password_generator/features/data/datasources/preference_datasource.dart';
import 'package:random_password_generator/features/data/repositories/preference_repository_impl.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/domain/repositories/preference_repository.dart';

import '../../../fixtures/fixture_reader.dart';

class PreferenceDatasourceMock extends Mock implements PreferenceDatasource {}

main() {
  const Map<String, dynamic> preferences = {
    "length": 20,
    "quantity": 5,
    "lowercaseLetters": true,
    "uppercaseLetters": true,
    "numbers": true,
    "specialCharacters": true,
    "latin1Characters": true,
  };
  late PreferenceRepository repository;
  late PreferenceDatasource datasource;
  late PasswordModel passwordModel;

  setUpAll(() {
    datasource = PreferenceDatasourceMock();
    repository = PreferenceRepositoryImpl(datasource: datasource);

    passwordModel = PasswordModel.fromJson(
      json: jsonDecode(fixture('password_model.json')),
    );

    registerFallbackValue(passwordModel);
  });

  group('Tests on PreferenceRepositoryImpl', () {
    test('Test savePreferences', () async {
      when(
        () => datasource.savePreferences(
          json: any(
            named: 'json',
            that: isNotNull,
          ),
        ),
      ).thenAnswer((_) async => true);

      final actual = await repository.savePreferences(
        passwordModel: passwordModel,
      );

      expect(actual, true);
    });

    test('test loadPreferences returning PasswordModel', () async {
      when(() => datasource.loadPreferences()).thenAnswer((_) => preferences);

      final PasswordModel? actual = await repository.loadPreferences();

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

    test('test loadPreferences returning null', () async {
      when(() => datasource.loadPreferences()).thenAnswer((_) => {});

      final PasswordModel? actual = await repository.loadPreferences();

      expect(actual, isNull);
    });
  });
}
