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
    return Center(
      child: GestureDetector(
        onTap: this.onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Column(
            children: [
              Text(
                this.password,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              Divider(
                height: 5,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
