part of 'password_model.dart';

extension PasswordModelExtension on PasswordModel {
  Map<String, dynamic> _toMap() => {
        'length': length,
        'quantity': quantity,
        'lowercaseLetters': lowercaseLetters,
        'uppercaseLetters': uppercaseLetters,
        'numbers': numbers,
        'specialCharacters': specialCharacters,
        'latin1Characters': latin1Characters,
      };

  static PasswordModel _fromMap({required Map<String, dynamic> json}) =>
      PasswordModel(
        length: json['length'],
        quantity: json['quantity'],
        lowercaseLetters: json['lowercaseLetters'],
        uppercaseLetters: json['uppercaseLetters'],
        numbers: json['numbers'],
        specialCharacters: json['specialCharacters'],
        latin1Characters: json['latin1Characters'],
      );
}
