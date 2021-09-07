import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String message;

  const ErrorDialog({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: const Key('error-dialog'),
      elevation: 25,
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Expanded(
            key: Key('error-dialog-icon'),
            flex: 1,
            child: Icon(Icons.error),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 6,
            child: Text(
              message,
              key: const Key('error-dialog-message'),
              softWrap: true,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          key: const Key('error-ok-button'),
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
