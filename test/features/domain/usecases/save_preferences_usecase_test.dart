import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/domain/repositories/preference_repository.dart';
import 'package:random_password_generator/features/domain/usecases/save_preferences_usecase.dart';

import '../../../fixtures/fixture_reader.dart';

class PreferenceRepositoryMock extends Mock implements PreferenceRepository {}

main() {
  late PreferenceRepository repository;
  late PasswordModel passwordModel;
  setUpAll(() {
    repository = PreferenceRepositoryMock();

    passwordModel = PasswordModel.fromJson(
      json: jsonDecode(fixture('password_model.json')),
    );

    registerFallbackValue(passwordModel);
  });

  test('Test on SavePreferencesUsecase', () async {
    when(
      () => repository.savePreferences(
        passwordModel: any(
          named: 'passwordModel',
          that: isNotNull,
        ),
      ),
    ).thenAnswer((_) async => true);

    final SavePreferencesUsecase usecase = SavePreferencesUsecase(
      repository: repository,
    );

    final bool actual = await usecase(
      passwordModel: passwordModel,
    );

    expect(actual, true);
  });
}
