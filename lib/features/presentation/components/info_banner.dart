import 'package:flutter/material.dart';

class InfoBanner extends StatelessWidget {
  final bool showBanner;
  final String message;
  final VoidCallback onPressed;

  const InfoBanner({
    Key? key,
    required this.showBanner,
    required this.message,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: this.showBanner,
      child: MaterialBanner(
        padding: const EdgeInsets.all(20),
        content: Text(
          this.message,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        leading: Icon(Icons.error),
        backgroundColor: const Color(0xFFE0E0E0),
        actions: <Widget>[
          TextButton(
            child: const Text('DISMISS'),
            onPressed: this.onPressed,
          ),
        ],
      ),
    );
  }
}
