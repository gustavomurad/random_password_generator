import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasswordListItem extends StatelessWidget {
  final String password;
  final GestureTapCallback onTap;

  const PasswordListItem({
    Key? key,
    required this.password,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Text(
          this.password,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
          softWrap: true,
        ),
      ),
    );
  }
}
