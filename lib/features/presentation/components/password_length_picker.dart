import 'package:flutter/material.dart';
import 'package:random_password_generator/features/presentation/components/number_picker.dart';

class PasswordLengthPicker extends StatelessWidget {
  final int length;
  final ValueChanged<int> onChanged;

  const PasswordLengthPicker({
    Key? key,
    required this.length,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      label: 'Length',
      value: this.length,
      minValue: 1,
      maxValue: 100,
      onChanged: this.onChanged,
    );
  }
}
