import 'package:flutter/material.dart';

class PasswordBottomSheet extends StatefulWidget {
  final Widget child;

  const PasswordBottomSheet({
    super.key,
    required this.child,
  });

  @override
  State<PasswordBottomSheet> createState() => _PasswordBottomSheetState();
}

class _PasswordBottomSheetState extends State<PasswordBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildHandle(), widget.child],
      ),
    );
  }

  Widget _buildHandle() {
    final theme = Theme.of(context);

    return FractionallySizedBox(
      widthFactor: 0.25,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: theme.dividerColor,
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }
}
