import 'package:flutter_test/flutter_test.dart';
import 'package:random_password_generator/features/password_generator/data/repositories/password_generator_repository_impl.dart';
import 'package:random_password_generator/features/password_generator/domain/models/preference_model.dart';

void main() {
  const PreferenceModel preferenceModel = PreferenceModel(
    length: 20,
    quantity: 5,
    lowercaseLetters: true,
    uppercaseLetters: true,
    numbers: true,
    specialCharacters: true,
    latin1Characters: true,
  );
  const repository = PasswordGeneratorRepositoryImpl();

  test('Call generatePassword method', () async {
    final passwords = await repository.generatePassword(
      preferenceModel: preferenceModel,
    );

    expect(passwords, isA<List<String>>());
    expect(passwords, isNotEmpty);
    expect(passwords.length, 5);
    expect(passwords[0], isNotEmpty);
    expect(passwords[0].length, 20);
  });

  test('Call savePreferences method', () async {
    final saved = await repository.savePreferences(
      preferenceModel: preferenceModel,
    );

    expect(saved, true);
  });

  test('Call savePreferences method', () async {
    final loadedModel = await repository.loadPreferences();

    expect(loadedModel, isA<PreferenceModel>());
    expect(loadedModel, isNotNull);
    expect(loadedModel, preferenceModel);
  });
}
