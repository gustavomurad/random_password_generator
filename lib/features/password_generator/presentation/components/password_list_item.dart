import 'package:flutter/material.dart';

class PasswordListItem extends StatelessWidget {
  final String password;
  final ValueChanged<String> onPressed;

  const PasswordListItem({
    super.key,
    required this.password,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        height: 50,
        onPressed: () => onPressed(password),
        child: Text(
          password,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
