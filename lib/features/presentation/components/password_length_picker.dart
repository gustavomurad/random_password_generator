import 'package:flutter/material.dart';
import 'package:random_password_generator/features/presentation/components/number_picker.dart';

class PasswordLengthPicker extends StatelessWidget {
  final String? label;
  final int length;

  final ValueChanged<int> onChanged;

  const PasswordLengthPicker({
    Key? key,
    this.label,
    required this.length,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      label: this.label,
      value: this.length,
      minValue: 1,
      maxValue: 100,
      onChanged: this.onChanged,
    );
  }
}
