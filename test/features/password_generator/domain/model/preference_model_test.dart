import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:random_password_generator/features/password_generator/domain/models/preference_model.dart';

import '../../../../fixtures/fixture_reader.dart';

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

  group('PreferenceModel tests', () {
    test('Test PreferenceModel entity', () {
      expect(preferences, isA<PreferenceModel>());
      expect(preferences.props, isNotEmpty);
    });

    test('Call toggleValues method', () {
      final toggleValues = preferences.toggleValues;

      expect(toggleValues, isA<List<bool>>());
      expect(toggleValues, isNotEmpty);
    });

    test('Call copyWith method', () {
      var model = preferences.copyWith();
      expect(model, preferences);

      model = preferences.copyWith(
        length: 10,
        quantity: 2,
        lowercaseLetters: false,
        uppercaseLetters: false,
        numbers: false,
        specialCharacters: false,
        latin1Characters: false,
      );

      expect(model, isA<PreferenceModel>());
      expect(model, isNotNull);
      expect(model, isNot(preferences));

      expect(model.length, 10);
      expect(model.quantity, 2);
      expect(model.lowercaseLetters, false);
      expect(model.uppercaseLetters, false);
      expect(model.numbers, false);
      expect(model.specialCharacters, false);
      expect(model.latin1Characters, false);
    });

    test('Call toJson method', () {
      final jsonResult = preferences.toJson();
      final jsonMap = jsonDecode(fixture('preference_model.json'));

      expect(jsonResult, jsonMap);
    });

    test('Call fromJson method', () {
      final Map<String, dynamic> jsonMap = jsonDecode(
        fixture('preference_model.json'),
      );

      final PreferenceModel result = PreferenceModel.fromJson(json: jsonMap);

      expect(result, preferences);
    });
  });
}
