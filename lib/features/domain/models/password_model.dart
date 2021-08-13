part 'password_model_extension.dart';

class PasswordModel {
  final int length;
  final int quantity;
  final bool lowercaseLetters;
  final bool uppercaseLetters;
  final bool numbers;
  final bool specialCharacters;
  final bool latin1Characters;

  PasswordModel({
    required this.length,
    required this.quantity,
    required this.lowercaseLetters,
    required this.uppercaseLetters,
    required this.numbers,
    required this.specialCharacters,
    required this.latin1Characters,
  });

  factory PasswordModel.fromJson({required Map<String, dynamic> json}) =>
      PasswordModelExtension._fromMap(json: json);

  Map<String, dynamic> toJson() => _toMap();
}
