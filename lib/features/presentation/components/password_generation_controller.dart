import 'package:flutter/material.dart';
import 'package:random_password_generator/features/presentation/components/character_choice_toggle_button.dart';
import 'package:random_password_generator/features/presentation/components/number_picker.dart';
import 'package:random_password_generator/features/presentation/components/rounded_corner_button.dart';

class PasswordGenerationController extends StatelessWidget {
  final String? refreshButtonLabel;
  final VoidCallback onRefreshButtonPressed;
  final String? copyAllButtonLabel;
  final VoidCallback onCopyAllButtonPressed;
  final String? quantityPickerLabel;
  final int quantityPickerValue;
  final ValueChanged<int> quantityPickerChanged;
  final String? lengthPickerLabel;
  final int lengthPickerValue;
  final ValueChanged<int> lengthPickerChanged;

  final ValueChanged<int> onToggleButtonPressed;
  final List<bool> onToggleButtonSelectedItems;
  final List<String> onToggleButtonChildren;

  const PasswordGenerationController({
    Key? key,
    this.refreshButtonLabel,
    required this.onRefreshButtonPressed,
    this.copyAllButtonLabel,
    required this.onCopyAllButtonPressed,
    this.quantityPickerLabel,
    required this.quantityPickerValue,
    required this.quantityPickerChanged,
    this.lengthPickerLabel,
    required this.lengthPickerValue,
    required this.lengthPickerChanged,
    required this.onToggleButtonPressed,
    required this.onToggleButtonSelectedItems,
    required this.onToggleButtonChildren,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Theme.of(context).primaryColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Flexible(
                flex: 5,
                child: RoundedCornerButton(
                  onPressed: this.onRefreshButtonPressed,
                  label: this.refreshButtonLabel,
                  icon: Icons.refresh,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                flex: 5,
                child: RoundedCornerButton(
                  onPressed: this.onCopyAllButtonPressed,
                  icon: Icons.copy,
                  label: this.copyAllButtonLabel,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: NumberPicker(
                  label: this.quantityPickerLabel,
                  minValue: 1,
                  maxValue: 100,
                  value: this.quantityPickerValue,
                  onChanged: this.quantityPickerChanged,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: NumberPicker(
                  label: this.lengthPickerLabel,
                  minValue: 1,
                  maxValue: 100,
                  value: this.lengthPickerValue,
                  onChanged: this.lengthPickerChanged,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CharacterChoiceToggleButton(
            onPressed: this.onToggleButtonPressed,
            isSelected: this.onToggleButtonSelectedItems,
            children: onToggleButtonChildren,
          ),
        ],
      ),
    );
  }
}
