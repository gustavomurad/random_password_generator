import 'package:flutter/material.dart';

class NumberPicker extends StatelessWidget {
  final String? label;
  final int value;
  final int minValue;
  final int maxValue;
  final ValueChanged<int> onChanged;

  const NumberPicker({
    Key? key,
    this.label,
    required this.value,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          if (label != null)
            Text(
              label!,
              key: Key('label'),
              style: Theme.of(context).textTheme.headline6,
            ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: IconButton(
                    key: Key('icon-button-remove'),
                    icon: const Icon(Icons.remove),
                    onPressed: value == minValue
                        ? () => onChanged(maxValue)
                        : () => onChanged(value - 1),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  value.toString(),
                  key: Key('value'),
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: IconButton(
                    key: Key('icon-button-add'),
                    onPressed: value == maxValue
                        ? () => onChanged(minValue)
                        : () => onChanged(value + 1),
                    icon: const Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
