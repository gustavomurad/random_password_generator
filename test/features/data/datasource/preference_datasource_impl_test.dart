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

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    sharedPreferences = await SharedPreferences.getInstance();
    datasource = PreferenceDatasourceImpl(
      preferences: sharedPreferences,
    );
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
  });

  // group('write', () {
  //   test(
  //       'completes '
  //       'when sharedPreferences.setString completes', () async {
  //     when(() => sharedPreferences.setString(any(), any()))
  //         .thenAnswer((_) => Future.value(true));
  //     expect(
  //       persistentStorage.write(key: mockKey, value: mockValue),
  //       completes,
  //     );
  //   });
  // });
}
