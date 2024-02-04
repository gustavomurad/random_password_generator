// Mocks generated by Mockito 5.4.4 from annotations
// in random_password_generator/test/features/password_generator/domain/usecases/password_generator_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:random_password_generator/features/password_generator/data/repositories/password_generator_repository.dart'
    as _i2;
import 'package:random_password_generator/features/password_generator/domain/models/preference_model.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [PasswordGeneratorRepository].
///
/// See the documentation for Mockito's code generation for more information.
class PasswordGeneratorRepositoryMock extends _i1.Mock
    implements _i2.PasswordGeneratorRepository {
  PasswordGeneratorRepositoryMock() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<String> generatePassword({required _i3.PreferenceModel? preferences}) =>
      (super.noSuchMethod(
        Invocation.method(
          #generatePassword,
          [],
          {#preferences: preferences},
        ),
        returnValue: <String>[],
      ) as List<String>);

  @override
  _i4.Future<bool> savePreferences(
          {required _i3.PreferenceModel? preferences}) =>
      (super.noSuchMethod(
        Invocation.method(
          #savePreferences,
          [],
          {#preferences: preferences},
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<_i3.PreferenceModel?> loadPreferences() => (super.noSuchMethod(
        Invocation.method(
          #loadPreferences,
          [],
        ),
        returnValue: _i4.Future<_i3.PreferenceModel?>.value(),
      ) as _i4.Future<_i3.PreferenceModel?>);
}
