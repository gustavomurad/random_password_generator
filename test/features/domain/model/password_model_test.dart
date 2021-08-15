import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';

import '../../../fixtures/fixture_reader.dart';

main() {
  final PasswordModel passwordModel = PasswordModel(
    length: 20,
    quantity: 5,
    lowercaseLetters: true,
    uppercaseLetters: true,
    numbers: true,
    specialCharacters: true,
    latin1Characters: true,
  );

  group('Test on DomainModel', () {
    test('Should be a subclass of DomainModel entity', () {
      expect(passwordModel, isA<PasswordModel>());
    });

    test('Call toJson method', () {
      final jsonResult = passwordModel.toJson();
      final jsonMap = jsonDecode(fixture('password_model.json'));

      expect(jsonResult, jsonMap);
    });

    test('Call fromJson method', () {
      final Map<String, dynamic> jsonMap = jsonDecode(
        fixture('password_model.json'),
      );

      final result = PasswordModel.fromJson(json: jsonMap);

      expect(result, passwordModel);
    });
  });
}
