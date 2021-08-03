import 'package:flutter/material.dart';

class ErrorDialog {
  final BuildContext context;
  final String message;

  const ErrorDialog({
    required this.context,
    required this.message,
  });

  show() => showDialog<void>(
        useSafeArea: true,
        context: this.context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
          key: Key('error-dialog'),
          elevation: 25,
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                key: Key('error-dialog-icon'),
                flex: 1,
                child: Icon(Icons.error),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 6,
                child: Text(
                  this.message,
                  key: Key('error-dialog-message'),
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              key: Key('error-ok-button'),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
}
