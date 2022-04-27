import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:random_password_generator/core/dependency_injection/cubit_dependency_injection.dart';
import 'package:random_password_generator/features/password_generator/domain/models/preference_model.dart';
import 'package:random_password_generator/features/password_generator/presentation/business_components/password_generator_cubit.dart';
import 'package:random_password_generator/features/password_generator/presentation/components/character_choice_toggle_button.dart';
import 'package:random_password_generator/features/password_generator/presentation/components/number_picker.dart';
import 'package:random_password_generator/features/password_generator/presentation/components/rounded_corner_button.dart';

class PreferencesUI extends StatefulWidget {
  final ValueChanged<PreferenceModel> onOkButtonPressed;
  final VoidCallback onCancelButtonPressed;

  const PreferencesUI({
    Key? key,
    required this.onOkButtonPressed,
    required this.onCancelButtonPressed,
  }) : super(key: key);

  @override
  _PreferencesUIState createState() => _PreferencesUIState();
}

class _PreferencesUIState extends State<PreferencesUI> {
  final List<String> toggleLabels = ['abc', 'ABC', '123', '!@%', 'Âæß'];
  final PasswordGeneratorCubit _cubit = CubitFactory.passwordGeneratorCubit;
  PreferenceModel preferences = PreferenceModel();
  late AppLocalizations _l10n;

  @override
  void initState() {
    super.initState();
    _cubit.loadPreferences();
  }

  @override
  Widget build(BuildContext context) {
    _l10n = AppLocalizations.of(context)!;
    return BlocListener<PasswordGeneratorCubit, PasswordGeneratorState>(
      bloc: _cubit,
      listener: (context, state) {
        if (state is PasswordGeneratorSuccessState) {
          setState(() {
            preferences = state.preferences ?? PreferenceModel();
          });
        }
      },
      child: LayoutBuilder(
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
                        label: _l10n.passwords,
                        minValue: 1,
                        maxValue: 100,
                        value: preferences.quantity,
                        onChanged: (value) => setState(
                          () => preferences = preferences.copyWith(
                            quantity: value,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: NumberPicker(
                        label: _l10n.length,
                        minValue: 1,
                        maxValue: 100,
                        value: preferences.length,
                        onChanged: (value) => setState(
                          () => preferences = preferences.copyWith(
                            length: value,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CharacterChoiceToggleButton(
                  onPressed: (index) => _canPressCharacterToggle(index)
                      ? setState(() => preferences = _getToggleValues(index))
                      : null,
                  isSelected: preferences.toggleValues,
                  children: toggleLabels,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: RoundedCornerButton(
                        onPressed: () => widget.onOkButtonPressed(preferences),
                        label: _l10n.ok,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      flex: 5,
                      child: RoundedCornerButton(
                        onPressed: widget.onCancelButtonPressed,
                        label: _l10n.cancel,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  bool _canPressCharacterToggle(int index) =>
      (preferences.toggleValues.where((element) => element).length != 1 ||
          index !=
              preferences.toggleValues.lastIndexWhere((element) => element));

  PreferenceModel _getToggleValues(int index) {
    switch (index) {
      case 0:
        return preferences.copyWith(
            lowercaseLetters: !preferences.lowercaseLetters);
      case 1:
        return preferences.copyWith(
            uppercaseLetters: !preferences.uppercaseLetters);
      case 2:
        return preferences.copyWith(numbers: !preferences.numbers);
      case 3:
        return preferences.copyWith(
            specialCharacters: !preferences.specialCharacters);
      default:
        return preferences.copyWith(
            latin1Characters: !preferences.latin1Characters);
    }
  }
}
