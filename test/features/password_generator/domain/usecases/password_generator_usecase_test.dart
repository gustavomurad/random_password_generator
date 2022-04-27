import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:random_password_generator/features/password_generator/data/repositories/password_generator_repository.dart';
import 'package:random_password_generator/features/password_generator/domain/models/preference_model.dart';
import 'package:random_password_generator/features/password_generator/domain/usecases/password_generator_usecase_impl.dart';

import 'password_generator_usecase_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<PasswordGeneratorRepository>(as: #PasswordGeneratorRepositoryMock),
])
void main() {
  const preferences = PreferenceModel(
    length: 20,
    quantity: 5,
    lowercaseLetters: true,
    uppercaseLetters: true,
    numbers: true,
    specialCharacters: true,
    latin1Characters: true,
  );

  const passwords = <String>[
    "ºÊFm¶§Ó¾ÜÖâ¶!YéhÙ«¹ù",
    ">:°a/ÓdjîÈR÷èí&Çå½¯v",
    "ÕÔÅë?§mS³¸ÊmPwÓÀÉüºg"
  ];

  final repository = PasswordGeneratorRepositoryMock();
  final usecase = PasswordGeneratorUsecaseImpl(repository: repository);

  test('Call generatePassword method', () async {
    when(
      repository.generatePassword(preferenceModel: preferences),
    ).thenAnswer((_) async => passwords);

    final passwordList =
        await usecase.generatePassword(preferenceModel: preferences);

    expect(passwordList, isA<List<String>>());
    expect(passwordList, isNotEmpty);
    expect(passwordList.length, 3);
    expect(passwordList[0].length, 20);
    expect(passwordList[0], isNotEmpty);
  });

  test('Call savePreferences method', () async {
    when(
      repository.savePreferences(preferenceModel: preferences),
    ).thenAnswer((_) async => true);

    final isSaved = await usecase.savePreferences(preferenceModel: preferences);

    expect(isSaved, true);
  });

  test('Call loadPreferences method', () async {
    when(repository.loadPreferences()).thenAnswer((_) async => preferences);

    final preferenceModel = await usecase.loadPreferences();

    expect(preferenceModel, isA<PreferenceModel>());
    expect(preferenceModel, isNotNull);
  });
}
