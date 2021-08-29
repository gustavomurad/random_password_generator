import 'package:flutter_test/flutter_test.dart';
import 'package:random_password_generator/core/util/password.dart';

void main() {
  final _regexLowerCaseLetters = RegExp(r'(^[a-z]*$)');
  final _regexUpperCaseLetters = RegExp(r'(^[A-Z]*$)');
  final _regexNumbers = RegExp(r'(^[0-9]*$)');
  final _regexSpecialCharacters = RegExp(r'(^[\W\S_]*$)');
  final _regexLatin1Characters = RegExp(r'(^[\u0020-\u007e\u00a0-\u00ff]*$)');

  group('Test of password length', () {
    test('should be able to generate a password of length 10', () async {
      final password = await Password.generate(length: 10);

      expect(password.first.length, 10);
    });

    test('should be able to generate a password of length 20', () async {
      final password = await Password.generate(length: 20);

      expect(password.first.length, 20);
    });

    test('should be able to generate a password of length 100', () async {
      final password = await Password.generate(length: 100);

      expect(password.first.length, 100);
    });
  });

  group('Test parameters', () {
    test('should be able to generate a lowercase letters password of length 20',
        () async {
      final password = await Password.generate(
        length: 20,
        includeLowercaseLetters: true,
        includeUppercaseLetters: false,
        includeNumbers: false,
        includeSpecialCharacters: false,
        includeLatin1Characters: false,
      );

      expect(password.length, 1);
      expect(password.first.length, 20);
      expect(_regexLowerCaseLetters.hasMatch(password.first), true);
    });

    test('should be able to generate a uppercase letters password of length 20',
        () async {
      final password = await Password.generate(
        length: 20,
        includeLowercaseLetters: false,
        includeUppercaseLetters: true,
        includeNumbers: false,
        includeSpecialCharacters: false,
        includeLatin1Characters: false,
      );

      expect(password.length, 1);
      expect(password.first.length, 20);
      expect(_regexUpperCaseLetters.hasMatch(password.first), true);
    });

    test('should be able to generate a numbers password of length 20',
        () async {
      final password = await Password.generate(
        length: 20,
        includeLowercaseLetters: false,
        includeUppercaseLetters: false,
        includeNumbers: true,
        includeSpecialCharacters: false,
        includeLatin1Characters: false,
      );

      expect(password.length, 1);
      expect(password.first.length, 20);
      expect(_regexNumbers.hasMatch(password.first), true);
    });
    test(
        'should be able to generate a special characters password of length 20',
        () async {
      final password = await Password.generate(
        length: 20,
        includeLowercaseLetters: false,
        includeUppercaseLetters: false,
        includeNumbers: false,
        includeSpecialCharacters: true,
        includeLatin1Characters: false,
      );

      expect(password.length, 1);
      expect(password.first.length, 20);
      expect(_regexSpecialCharacters.hasMatch(password.first), true);
    });
    test('should be able to generate a latin1 characters password of length 20',
        () async {
      final password = await Password.generate(
        length: 20,
        includeLowercaseLetters: false,
        includeUppercaseLetters: false,
        includeNumbers: false,
        includeSpecialCharacters: false,
        includeLatin1Characters: true,
      );

      expect(password.length, 1);
      expect(password.first.length, 20);
      expect(_regexLatin1Characters.hasMatch(password.first), true);
    });
    test('Throws a ArgumentError if none of the character typed are selected',
        () async {
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

  group('Test parameters with multiple passwords', () {
    test(
        'should be able to generate a 10 lowercase letters password of length 20',
        () async {
      final List<String> passwords = await Password.generate(
        length: 20,
        quantity: 10,
        includeLowercaseLetters: true,
        includeUppercaseLetters: false,
        includeNumbers: false,
        includeSpecialCharacters: false,
        includeLatin1Characters: false,
      );

      expect(passwords.length, 10);

      for (var password in passwords) {
        expect(password.length, 20);
        expect(_regexLowerCaseLetters.hasMatch(password), true);
      }
    });

    test(
        'should be able to generate a 10 uppercase letters password of length 20',
        () async {
      final List<String> passwords = await Password.generate(
        length: 20,
        quantity: 10,
        includeLowercaseLetters: false,
        includeUppercaseLetters: true,
        includeNumbers: false,
        includeSpecialCharacters: false,
        includeLatin1Characters: false,
      );

      expect(passwords.length, 10);

      for (var password in passwords) {
        expect(password.length, 20);
        expect(_regexUpperCaseLetters.hasMatch(password), true);
      }
    });

    test('should be able to generate a numbers password of length 20',
        () async {
      final passwords = await Password.generate(
        length: 20,
        quantity: 10,
        includeLowercaseLetters: false,
        includeUppercaseLetters: false,
        includeNumbers: true,
        includeSpecialCharacters: false,
        includeLatin1Characters: false,
      );

      expect(passwords.length, 10);

      for (var password in passwords) {
        expect(password.length, 20);
        expect(_regexNumbers.hasMatch(password), true);
      }
    });
    test(
        'should be able to generate a special characters password of length 20',
        () async {
      final List<String> passwords = await Password.generate(
        length: 20,
        quantity: 10,
        includeLowercaseLetters: false,
        includeUppercaseLetters: false,
        includeNumbers: false,
        includeSpecialCharacters: true,
        includeLatin1Characters: false,
      );

      expect(passwords.length, 10);

      for (var password in passwords) {
        expect(password.length, 20);
        expect(_regexSpecialCharacters.hasMatch(password), true);
      }
    });
    test('should be able to generate a latin1 characters password of length 20',
        () async {
      final List<String> passwords = await Password.generate(
        length: 20,
        quantity: 10,
        includeLowercaseLetters: false,
        includeUppercaseLetters: false,
        includeNumbers: false,
        includeSpecialCharacters: false,
        includeLatin1Characters: true,
      );

      expect(passwords.length, 10);

      for (var password in passwords) {
        expect(password.length, 20);
        expect(_regexLatin1Characters.hasMatch(password), true);
      }
    });
    test('Throws a ArgumentError if none of the character typed are selected',
        () async {
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
