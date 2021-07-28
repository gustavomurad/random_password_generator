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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: onTap,
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.headline4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Text(
                  this.password,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
