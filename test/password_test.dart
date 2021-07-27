import 'package:flutter_test/flutter_test.dart';
import 'package:random_password_generator/core/util/password.dart';

void main() {
  group('Test of password length', () {
    test('should be able to generate a password of length 10', () {
      final password = Password.generate(length: 10);

      expect(password.first.length, 10);
    });

    test('should be able to generate a password of length 20', () {
      final password = Password.generate(length: 20);

      expect(password.first.length, 20);
    });

    test('should be able to generate a password of length 100', () {
      final password = Password.generate(length: 100);

      expect(password.first.length, 100);
    });
  });

  group('Test parameters', () {
    test('should be able to generate a lowercase letters password of length 20',
        () {
      final password = Password.generate(
        length: 20,
        includeLowercaseLetters: true,
        includeUppercaseLetters: false,
        includeNumbers: false,
        includeSpecialCharacters: false,
        includeLatin1Characters: false,
      );

      final regex = RegExp(r'(^[a-z]*$)');

      expect(password.length, 20);
      expect(regex.hasMatch(password.first), true);
    });

    test('should be able to generate a uppercase letters password of length 20',
        () {
      final password = Password.generate(
        length: 20,
        includeLowercaseLetters: false,
        includeUppercaseLetters: true,
        includeNumbers: false,
        includeSpecialCharacters: false,
        includeLatin1Characters: false,
      );

      final regex = RegExp(r'(^[A-Z]*$)');

      expect(password.length, 20);
      expect(regex.hasMatch(password.first), true);
    });

    test('should be able to generate a numbers password of length 20', () {
      final password = Password.generate(
        length: 20,
        includeLowercaseLetters: false,
        includeUppercaseLetters: false,
        includeNumbers: true,
        includeSpecialCharacters: false,
        includeLatin1Characters: false,
      );

      final regex = RegExp(r'(^[0-9]*$)');

      expect(password.length, 20);
      expect(regex.hasMatch(password.first), true);
    });
    test(
        'should be able to generate a special characters password of length 20',
        () {
      final password = Password.generate(
        length: 20,
        includeLowercaseLetters: false,
        includeUppercaseLetters: false,
        includeNumbers: false,
        includeSpecialCharacters: true,
        includeLatin1Characters: false,
      );

      final regex = RegExp(r'(^[\W\S_]*$)');

      expect(password.length, 20);
      expect(regex.hasMatch(password.first), true);
    });
    test('should be able to generate a latin1 characters password of length 20',
        () {
      final password = Password.generate(
        length: 20,
        includeLowercaseLetters: false,
        includeUppercaseLetters: false,
        includeNumbers: false,
        includeSpecialCharacters: false,
        includeLatin1Characters: true,
      );

      final regex = RegExp(r'(^[\u0020-\u007e\u00a0-\u00ff]*$)');

      expect(password.length, 20);
      expect(regex.hasMatch(password.first), true);
    });
    test('Throws a ArgumentError if none of the character typed are selected',
        () {
      expect(
          () => Password.generate(
                length: 20,
                includeLowercaseLetters: false,
                includeUppercaseLetters: false,
                includeNumbers: false,
                includeSpecialCharacters: false,
                includeLatin1Characters: false,
              ),
          throwsA(isA<ArgumentError>()));
    });
  });
}
