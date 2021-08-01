import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasswordListItem extends StatelessWidget {
  final String password;

  const PasswordListItem({
    Key? key,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: SelectableText(
        this.password,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
