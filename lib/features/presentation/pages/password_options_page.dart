import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/presentation/bloc/preference/preference_bloc.dart';
import 'package:random_password_generator/features/presentation/components/character_choice_toggle_button.dart';
import 'package:random_password_generator/features/presentation/components/number_picker.dart';
import 'package:random_password_generator/features/presentation/components/rounded_corner_button.dart';

class PasswordOptionsPage extends StatefulWidget {
  final String? okButtonLabel;
  final ValueChanged<PasswordModel> onOkButtonPressed;
  final String? cancelButtonLabel;
  final VoidCallback onCancelButtonPressed;
  final String? quantityPickerLabel;
  final int quantityPickerValue;
  final String? lengthPickerLabel;
  final int lengthPickerValue;
  final List<bool> toggleValues;

  const PasswordOptionsPage({
    Key? key,
    this.okButtonLabel,
    required this.onOkButtonPressed,
    this.cancelButtonLabel,
    required this.onCancelButtonPressed,
    this.quantityPickerLabel,
    required this.quantityPickerValue,
    this.lengthPickerLabel,
    required this.lengthPickerValue,
    required this.toggleValues,
  }) : super(key: key);

  @override
  _PasswordOptionsPageState createState() => _PasswordOptionsPageState();
}

class _PasswordOptionsPageState extends State<PasswordOptionsPage> {
  final List<String> toggleLabels = ['abc', 'ABC', '123', '!@%', 'Âæß'];
  late int length;
  late int quantity;
  late List<bool> toggleValues;

  @override
  void initState() {
    super.initState();

    BlocProvider.of<PreferenceBloc>(context).add(LoadPreferences());

    length = widget.lengthPickerValue;
    toggleValues = widget.toggleValues;
    quantity = widget.quantityPickerValue;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PreferenceBloc, PreferenceState>(
      listener: (context, state) {
        if (state is PreferenceSuccessState) {
          setState(() {
            length = state.passwordModel.length;
            toggleValues = state.toggleValues;
            quantity = state.passwordModel.quantity;
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
                        label: widget.quantityPickerLabel,
                        minValue: 1,
                        maxValue: 100,
                        value: quantity,
                        onChanged: (value) => setState(
                          () => quantity = value,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: NumberPicker(
                        label: widget.lengthPickerLabel,
                        minValue: 1,
                        maxValue: 100,
                        value: length,
                        onChanged: (value) {
                          setState(() {
                            length = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CharacterChoiceToggleButton(
                  onPressed: (index) => _canPressCharacterToggle(index)
                      ? setState(() {
                          toggleValues[index] = !toggleValues[index];
                        })
                      : null,
                  isSelected: toggleValues,
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
                        onPressed: () => widget.onOkButtonPressed(
                          passwordModel,
                        ),
                        label: widget.okButtonLabel,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      flex: 5,
                      child: RoundedCornerButton(
                        onPressed: widget.onCancelButtonPressed,
                        label: widget.cancelButtonLabel,
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

  PasswordModel get passwordModel => PasswordModel(
        length: length,
        quantity: quantity,
        lowercaseLetters: toggleValues[0],
        uppercaseLetters: toggleValues[1],
        numbers: toggleValues[2],
        specialCharacters: toggleValues[3],
        latin1Characters: toggleValues[4],
      );

  bool _canPressCharacterToggle(int index) =>
      (toggleValues.where((element) => element).length != 1 ||
          index != toggleValues.lastIndexWhere((element) => element));
}
