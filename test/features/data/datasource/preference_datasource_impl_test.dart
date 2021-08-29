import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:random_password_generator/features/data/datasources/preference_datasource.dart';
import 'package:random_password_generator/features/data/datasources/preference_datasource_impl.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/fixture_reader.dart';

main() {
  late PreferenceDatasource datasource;
  late SharedPreferences sharedPreferences;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({
      "length": 20,
      "quantity": 5,
      "lowercaseLetters": true,
      "uppercaseLetters": true,
      "numbers": true,
      "specialCharacters": true,
      "latin1Characters": true
    });
    TestWidgetsFlutterBinding.ensureInitialized();
    sharedPreferences = await SharedPreferences.getInstance();
    datasource = PreferenceDatasourceImpl(
      preferences: sharedPreferences,
    );
  });

  tearDownAll(() async {
    await sharedPreferences.clear();
  });

  group('Test PreferenceServiceImpl', () {
    test('Test savePreferences method', () async {
      final PasswordModel passwordModel = PasswordModel.fromJson(
        json: jsonDecode(
          fixture('password_model.json'),
        ),
      );
      final json = passwordModel.toJson();

      expect(await datasource.savePreferences(json: json), true);
    });

    test('Test readPreferences method', () {
      final PasswordModel passwordModel = PasswordModel.fromJson(
        json: jsonDecode(
          fixture('password_model.json'),
        ),
      );
      final jsonMatcher = passwordModel.toJson();
      final jsonExpect = datasource.loadPreferences();

      expect(jsonExpect, jsonMatcher);
    });
  });
}
