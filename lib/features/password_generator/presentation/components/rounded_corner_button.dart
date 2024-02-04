import 'package:flutter/material.dart';

class RoundedCornerButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final VoidCallback? onPressed;

  const RoundedCornerButton({
    super.key,
    this.label,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: const Size(
          kMinInteractiveDimension,
          kMinInteractiveDimension,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon),
          const SizedBox(
            width: 10,
          ),
          if (label != null) Text(label!),
        ],
      ),
    );
  }
}
