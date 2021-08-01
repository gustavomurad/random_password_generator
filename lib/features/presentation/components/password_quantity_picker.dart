import 'package:flutter/material.dart';
import 'package:random_password_generator/features/presentation/components/number_picker.dart';

class PasswordQuantityPicker extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onChanged;

  const PasswordQuantityPicker({
    Key? key,
    required this.quantity,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      label: 'Passwords',
      minValue: 1,
      maxValue: 100,
      value: this.quantity,
      onChanged: this.onChanged,
    );
  }
}
