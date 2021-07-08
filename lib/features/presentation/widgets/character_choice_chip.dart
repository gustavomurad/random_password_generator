import 'package:flutter/material.dart';

class CharacterChoiceChip extends StatelessWidget {
  final String label;
  final bool selectedChip;
  final ValueChanged<bool> onSelected;

  const CharacterChoiceChip({
    Key? key,
    required this.label,
    required this.selectedChip,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: ChoiceChip(
        elevation: 2,
        label: Text(this.label),
        selected: this.selectedChip,
        onSelected: (value) => this.onSelected(value),
      ),
    );
  }
}
