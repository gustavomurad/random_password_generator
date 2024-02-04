import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:random_password_generator/features/password_generator/domain/models/preference_model.dart';
import 'package:random_password_generator/features/password_generator/presentation/business_components/password_generator_cubit.dart';
import 'package:random_password_generator/features/password_generator/presentation/components/character_choice_toggle_button.dart';
import 'package:random_password_generator/features/password_generator/presentation/components/number_picker.dart';
import 'package:random_password_generator/features/password_generator/presentation/components/rounded_corner_button.dart';

class PreferencesUI extends StatelessWidget {
  static const _toggleLabels = <String>['abc', 'ABC', '123', '!@%', 'Âæß'];

  const PreferencesUI({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocBuilder<PasswordGeneratorCubit, PasswordGeneratorState>(
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Theme.of(context).primaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: NumberPicker(
                          label: l10n.passwords,
                          minValue: 1,
                          maxValue: 100,
                          value: state.preferences.quantity,
                          onChanged: (quantity) =>
                              context.read<PasswordGeneratorCubit>().savePreferences(preferences: state.preferences.copyWith(quantity: quantity)),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: NumberPicker(
                          label: l10n.length,
                          minValue: 1,
                          maxValue: 100,
                          value: state.preferences.length,
                          onChanged: (length) =>
                              context.read<PasswordGeneratorCubit>().savePreferences(preferences: state.preferences.copyWith(length: length)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CharacterChoiceToggleButton(
                    onPressed: (index) => _canPressCharacterToggle(index, state.preferences)
                        ? context.read<PasswordGeneratorCubit>().savePreferences(preferences: _getToggleValues(index, state.preferences))
                        : null,
                    isSelected: state.preferences.toggleValues,
                    children: _toggleLabels,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RoundedCornerButton(
                          onPressed: () {
                            context.read<PasswordGeneratorCubit>().generatePassword(preferences: state.preferences);
                            Navigator.of(context).pop();
                          },
                          label: l10n.ok,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: RoundedCornerButton(
                          onPressed: () => Navigator.of(context).pop(),
                          label: l10n.cancel,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  bool _canPressCharacterToggle(int index, PreferenceModel preferences) =>
      (preferences.toggleValues.where((element) => element).length != 1 || index != preferences.toggleValues.lastIndexWhere((element) => element));

  PreferenceModel _getToggleValues(int index, PreferenceModel preferences) {
    switch (index) {
      case 0:
        return preferences.copyWith(lowercaseLetters: !preferences.lowercaseLetters);
      case 1:
        return preferences.copyWith(uppercaseLetters: !preferences.uppercaseLetters);
      case 2:
        return preferences.copyWith(numbers: !preferences.numbers);
      case 3:
        return preferences.copyWith(specialCharacters: !preferences.specialCharacters);
      case 4:
        return preferences.copyWith(latin1Characters: !preferences.latin1Characters);
      default:
        return const PreferenceModel();
    }
  }
}
