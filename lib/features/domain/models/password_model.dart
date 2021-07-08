class PasswordModel {
  final int length;
  final bool lowercaseLetters;
  final bool uppercaseLetters;
  final bool numbers;
  final bool specialCharacters;
  final bool latin1Characters;

  PasswordModel({
    required this.length,
    required this.lowercaseLetters,
    required this.uppercaseLetters,
    required this.numbers,
    required this.specialCharacters,
    required this.latin1Characters,
  });
}
