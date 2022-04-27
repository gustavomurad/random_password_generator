import 'package:equatable/equatable.dart';

class PreferenceModel extends Equatable {
  final int length;
  final int quantity;
  final bool lowercaseLetters;
  final bool uppercaseLetters;
  final bool numbers;
  final bool specialCharacters;
  final bool latin1Characters;

  const PreferenceModel({
    this.length = 20,
    this.quantity = 10,
    this.lowercaseLetters = true,
    this.uppercaseLetters = true,
    this.numbers = true,
    this.specialCharacters = true,
    this.latin1Characters = true,
  });

  Map<String, dynamic> toJson() => {
        'length': length,
        'quantity': quantity,
        'lowercaseLetters': lowercaseLetters,
        'uppercaseLetters': uppercaseLetters,
        'numbers': numbers,
        'specialCharacters': specialCharacters,
        'latin1Characters': latin1Characters,
      };

  PreferenceModel copyWith({
    int? length,
    int? quantity,
    bool? lowercaseLetters,
    bool? uppercaseLetters,
    bool? numbers,
    bool? specialCharacters,
    bool? latin1Characters,
  }) =>
      PreferenceModel(
        length: length ?? this.length,
        quantity: quantity ?? this.quantity,
        lowercaseLetters: lowercaseLetters ?? this.lowercaseLetters,
        uppercaseLetters: uppercaseLetters ?? this.uppercaseLetters,
        numbers: numbers ?? this.numbers,
        specialCharacters: specialCharacters ?? this.specialCharacters,
        latin1Characters: latin1Characters ?? this.latin1Characters,
      );

  factory PreferenceModel.fromJson({required Map<String, dynamic> json}) =>
      PreferenceModel(
        length: json['length'],
        quantity: json['quantity'],
        lowercaseLetters: json['lowercaseLetters'],
        uppercaseLetters: json['uppercaseLetters'],
        numbers: json['numbers'],
        specialCharacters: json['specialCharacters'],
        latin1Characters: json['latin1Characters'],
      );

  @override
  List<Object> get props => [
        length,
        quantity,
        lowercaseLetters,
        uppercaseLetters,
        numbers,
        specialCharacters,
        latin1Characters,
      ];

  List<bool> get toggleValues => [
        lowercaseLetters,
        uppercaseLetters,
        numbers,
        specialCharacters,
        latin1Characters,
      ];
}
