import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_password_generator/features/data/repositories/password_repository_impl.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/domain/repositories/password_repository.dart';
import 'package:random_password_generator/features/domain/services/password_service.dart';

import '../../../fixtures/fixture_reader.dart';

class PasswordServiceMock extends Mock implements PasswordService {}

main() {
  late PasswordRepository repository;
  late PasswordService service;
  late List<String> passwords;
  late PasswordModel model;
  setUpAll(() {
    service = PasswordServiceMock();
    repository = PasswordRepositoryImpl(service: service);
    passwords = jsonDecode(fixture('passwords.json'))['passwords'];
    model = PasswordModel.fromJson(
      json: jsonDecode(fixture('password_model.json')),
    );
  });

  test('Test on PasswordRepositoryImpl', () async {
    when(
      () => repository.generatePassword(
        passwordModel: any(
          named: 'passwordModel',
          that: isNotNull,
        ),
      ),
    ).thenAnswer((_) async => passwords);

    final matcher = await repository.generatePassword(passwordModel: model);

    expect(matcher.isNotEmpty, true);
    expect(passwords.elementAt(0), matcher.elementAt(0));
    expect(passwords.elementAt(1), matcher.elementAt(1));
    expect(passwords.elementAt(2), matcher.elementAt(2));
  });
}
