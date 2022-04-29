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
  static const _toggleLabels = <String>['abc', 'ABC', '123', '!@%', 'Âæß'];
  final _cubit = CubitFactory.passwordGeneratorCubit;
  var _preferences = PreferenceModel();
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
            _preferences = state.preferences ?? PreferenceModel();
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
                        value: _preferences.quantity,
                        onChanged: (value) => setState(
                          () => _preferences = _preferences.copyWith(
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
                        value: _preferences.length,
                        onChanged: (value) => setState(
                          () => _preferences = _preferences.copyWith(
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
                      ? setState(() => _preferences = _getToggleValues(index))
                      : null,
                  isSelected: _preferences.toggleValues,
                  children: _toggleLabels,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RoundedCornerButton(
                        onPressed: () => widget.onOkButtonPressed(_preferences),
                        label: _l10n.ok,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
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
      (_preferences.toggleValues.where((element) => element).length != 1 ||
          index !=
              _preferences.toggleValues.lastIndexWhere((element) => element));

  PreferenceModel _getToggleValues(int index) {
    switch (index) {
      case 0:
        return _preferences.copyWith(
            lowercaseLetters: !_preferences.lowercaseLetters);
      case 1:
        return _preferences.copyWith(
            uppercaseLetters: !_preferences.uppercaseLetters);
      case 2:
        return _preferences.copyWith(numbers: !_preferences.numbers);
      case 3:
        return _preferences.copyWith(
            specialCharacters: !_preferences.specialCharacters);
      case 4:
        return _preferences.copyWith(
            latin1Characters: !_preferences.latin1Characters);
      default:
        return PreferenceModel();
    }
  }
}
