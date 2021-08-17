import 'package:flutter_test/flutter_test.dart';
import 'package:random_password_generator/features/data/services/password_service_impl.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';

main() {
  final PasswordModel passwordModel = PasswordModel(
    length: 20,
    quantity: 10,
    lowercaseLetters: true,
    uppercaseLetters: true,
    numbers: true,
    specialCharacters: true,
    latin1Characters: true,
  );

  group('Test PasswordServiceImpl', () {
    test('should be able to generate 10 passwords of length 20', () async {
      final PasswordServiceImpl service = PasswordServiceImpl();
      final List<String> passwords = await service.generatePassword(
        passwordModel: passwordModel,
      );

      expect(passwords.length, 10);

      for (var password in passwords) {
        expect(password.length, 20);
      }
    });
  });
}
