import 'package:flutter/material.dart';

class RoundedCornerButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final VoidCallback? onPressed;

  const RoundedCornerButton({
    Key? key,
    this.label,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onPressed,
      style: TextButton.styleFrom(
        minimumSize: const Size(10, 40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (this.icon != null) Icon(this.icon),
          const SizedBox(
            width: 10,
          ),
          if (this.label != null) Text(this.label!),
        ],
      ),
    );
  }
}
