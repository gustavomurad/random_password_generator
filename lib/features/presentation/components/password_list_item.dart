import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasswordListItem extends StatelessWidget {
  final String password;
  final ValueChanged<String> onPressed;

  const PasswordListItem({
    Key? key,
    required this.password,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: MaterialButton(
        height: 50,
        onPressed: () => this.onPressed(this.password),
        child: Text(
          this.password,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
