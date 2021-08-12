part of 'password_model.dart';

extension PasswordModelExtension on PasswordModel {
  Map<String, dynamic> _toMap() => {
        'length': this.length,
        'quantity': this.quantity,
        'lowercaseLetters': this.lowercaseLetters,
        'uppercaseLetters': this.uppercaseLetters,
        'numbers': this.numbers,
        'specialCharacters': this.specialCharacters,
        'latin1Characters': this.latin1Characters,
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
