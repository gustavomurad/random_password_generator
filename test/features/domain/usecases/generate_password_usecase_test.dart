import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/domain/repositories/password_repository.dart';
import 'package:random_password_generator/features/domain/usecases/generate_password_usecase.dart';

import '../../../fixtures/fixture_reader.dart';

class PasswordRepositoryMock extends Mock implements PasswordRepository {}

main() {
  const List<String> passwords = [
    "ºÊFm¶§Ó¾ÜÖâ¶!YéhÙ«¹ù",
    ">:°a/ÓdjîÈR÷èí&Çå½¯v",
    "ÕÔÅë?§mS³¸ÊmPwÓÀÉüºg"
  ];

  late PasswordRepository repository;
  late PasswordModel model;

  setUpAll(() {
    repository = PasswordRepositoryMock();
    model = PasswordModel.fromJson(
      json: jsonDecode(fixture('password_model.json')),
    );

    registerFallbackValue(model);
  });

  test('Test on GeneratePasswordUsecase', () async {
    when(
      () => repository.generatePassword(
        passwordModel: any(
          named: 'passwordModel',
          that: isNotNull,
        ),
      ),
    ).thenAnswer((invocation) async => passwords);

    final GeneratePasswordUsecase usecase = GeneratePasswordUsecase(
      repository: repository,
    );

    final actual = await usecase(passwordModel: model);

    expect(actual, isA<List<String>>());
    expect(actual.elementAt(0), "ºÊFm¶§Ó¾ÜÖâ¶!YéhÙ«¹ù");
    expect(actual.elementAt(1), ">:°a/ÓdjîÈR÷èí&Çå½¯v");
    expect(actual.elementAt(2), "ÕÔÅë?§mS³¸ÊmPwÓÀÉüºg");
  });
}
