import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(this.icon),
          const SizedBox(
            width: 10,
          ),
          Text(this.label)
        ],
      ),
    );
  }
}
