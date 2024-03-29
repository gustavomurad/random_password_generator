import 'package:flutter/material.dart';

class CharacterChoiceToggleButton extends StatelessWidget {
  final ValueChanged<int> onPressed;
  final List<bool> isSelected;
  final List<String> children;

  const CharacterChoiceToggleButton({
    super.key,
    required this.onPressed,
    required this.isSelected,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ToggleButtons(
          constraints: BoxConstraints.expand(
            width: (constraints.biggest.width - 10) / children.length,
            height: kMinInteractiveDimension,
          ),
          isSelected: isSelected,
          onPressed: (index) => onPressed(index),
          borderRadius: BorderRadius.circular(30),
          children: List.generate(
            children.length,
            (index) => createButton(children.elementAt(index)),
            growable: false,
          ),
        );
      },
    );
  }

  Widget createButton(String label) {
    return Text(label);
  }
}
