import 'package:random_password_generator/core/util/password.dart';
import 'package:random_password_generator/features/data/services/password_service.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';

class PasswordServiceImpl implements PasswordService {
  @override
  Future<String> generatePassword({
    required PasswordModel passwordModel,
  }) async {
    return Password.generate(
      length: passwordModel.length,
      includeLowercaseLetters: passwordModel.lowercaseLetters,
      includeUppercaseLetters: passwordModel.uppercaseLetters,
      includeNumbers: passwordModel.numbers,
      includeSpecialCharacters: passwordModel.specialCharacters,
      includeLatin1Characters: passwordModel.latin1Characters,
    );
  }
}
