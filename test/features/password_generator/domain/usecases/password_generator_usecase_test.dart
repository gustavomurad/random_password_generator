import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:random_password_generator/features/password_generator/data/repositories/password_generator_repository.dart';
import 'package:random_password_generator/features/password_generator/domain/models/preference_model.dart';
import 'package:random_password_generator/features/password_generator/domain/usecases/password_generator_usecase_impl.dart';

import '../../../../fixtures/model_mocks.dart';
import 'password_generator_usecase_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<PasswordGeneratorRepository>(as: #PasswordGeneratorRepositoryMock),
])
void main() {
  final preferenceModel = ModelMocks.preferenceModel;
  final passwords = ModelMocks.passwordList;

  final repository = PasswordGeneratorRepositoryMock();
  final usecase = PasswordGeneratorUseCaseImpl(repository: repository);

  test('Call generatePassword method', () async {
    when(
      repository.generatePassword(preferences: preferenceModel),
    ).thenAnswer((_) => passwords);

    final passwordList = usecase.generatePassword(preferences: preferenceModel);

    expect(passwordList, isA<List<String>>());
    expect(passwordList, isNotEmpty);
    expect(passwordList.length, 3);
    expect(passwordList.first.length, 20);
    expect(passwordList.first, isNotEmpty);
  });

  test('Call savePreferences method', () async {
    when(
      repository.savePreferences(preferences: preferenceModel),
    ).thenAnswer((_) async => true);

    final isSaved = await usecase.savePreferences(preferences: preferenceModel);

    expect(isSaved, true);
  });

  test('Call loadPreferences method', () async {
    when(repository.loadPreferences()).thenAnswer((_) async => preferenceModel);

    final preferences = await usecase.loadPreferences();

    expect(preferences, isA<PreferenceModel>());
    expect(preferences, isNotNull);
  });
}
