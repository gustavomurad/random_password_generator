import 'package:flutter/material.dart';

class PasswordLengthSlider extends StatelessWidget {
  final int length;
  final ValueChanged<double> onChanged;

  const PasswordLengthSlider({
    Key? key,
    required this.length,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Password length: ${this.length}',
          style: Theme.of(context).textTheme.headline6,
        ),
        Slider(
          value: this.length.toDouble(),
          min: 1,
          max: 100,
          onChanged: this.onChanged,
        ),
      ],
    );
  }
}
