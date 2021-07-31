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
          elevation: 25,
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
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
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
}
