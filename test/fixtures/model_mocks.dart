import 'package:random_password_generator/features/password_generator/domain/models/preference_model.dart';

class ModelMocks {
  static get preferenceModel => PreferenceModel(
        length: 20,
        quantity: 5,
        lowercaseLetters: true,
        uppercaseLetters: true,
        numbers: true,
        specialCharacters: true,
        latin1Characters: true,
      );

  static get passwordList => <String>[
        "ºÊFm¶§Ó¾ÜÖâ¶!YéhÙ«¹ù",
        ">:°a/ÓdjîÈR÷èí&Çå½¯v",
        "ÕÔÅë?§mS³¸ÊmPwÓÀÉüºg"
      ];
}
