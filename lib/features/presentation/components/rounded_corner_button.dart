import 'package:flutter/material.dart';

class RoundedCornerButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;

  const RoundedCornerButton({
    Key? key,
    required this.label,
    required this.icon,
    this.onPressed,
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
