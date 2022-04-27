import 'package:flutter/material.dart';

class CharacterChoiceToggleButton extends StatelessWidget {
  final ValueChanged<int> onPressed;
  final List<bool> isSelected;
  final List<String> children;

  const CharacterChoiceToggleButton({
    Key? key,
    required this.onPressed,
    required this.isSelected,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ToggleButtons(
          constraints: BoxConstraints.expand(
            width: (constraints.biggest.width - 10) / children.length,
            height: 45,
          ),
          children: List.generate(
            children.length,
            (index) => createButton(children.elementAt(index)),
            growable: false,
          ),
          isSelected: isSelected,
          onPressed: (index) => onPressed(index),
          borderRadius: BorderRadius.circular(30),
        );
      },
    );
  }

  Widget createButton(String label) {
    return Container(
      child: Text(label),
    );
  }
}
