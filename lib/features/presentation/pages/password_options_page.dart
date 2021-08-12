import 'package:flutter/material.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';
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
    this.length = this.widget.lengthPickerValue;
    this.toggleValues = this.widget.toggleValues;
    this.quantity = this.widget.quantityPickerValue;
  }

  @override
  Widget build(BuildContext context) {
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
                      label: this.widget.quantityPickerLabel,
                      minValue: 1,
                      maxValue: 100,
                      value: this.quantity,
                      onChanged: (value) => setState(
                        () => this.quantity = value,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: NumberPicker(
                      label: this.widget.lengthPickerLabel,
                      minValue: 1,
                      maxValue: 100,
                      value: this.length,
                      onChanged: (value) {
                        setState(() {
                          this.length = value;
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
                        this.toggleValues[index] = !this.toggleValues[index];
                      })
                    : null,
                isSelected: this.toggleValues,
                children: this.toggleLabels,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: RoundedCornerButton(
                      onPressed: () => this.widget.onOkButtonPressed(
                            passwordModel,
                          ),
                      label: this.widget.okButtonLabel,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    flex: 5,
                    child: RoundedCornerButton(
                      onPressed: this.widget.onCancelButtonPressed,
                      label: this.widget.cancelButtonLabel,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  PasswordModel get passwordModel => PasswordModel(
        length: this.length,
        quantity: this.quantity,
        lowercaseLetters: this.toggleValues[0],
        uppercaseLetters: this.toggleValues[1],
        numbers: this.toggleValues[2],
        specialCharacters: this.toggleValues[3],
        latin1Characters: this.toggleValues[4],
      );

  bool _canPressCharacterToggle(int index) => (this
              .toggleValues
              .where(
                (element) => element,
              )
              .length !=
          1 ||
      index !=
          this.toggleValues.lastIndexWhere(
                (element) => element,
              ));
}
