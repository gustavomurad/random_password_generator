import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          if (this.label != null)
            Text(
              this.label!,
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
                child: Ink(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: IconButton(
                    key: Key('icon-button-remove'),
                    icon: const Icon(Icons.remove),
                    onPressed: this.value == this.minValue
                        ? () => this.onChanged(this.maxValue)
                        : () => this.onChanged(this.value - 1),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  this.value.toString(),
                  key: Key('value'),
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Ink(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: IconButton(
                    key: Key('icon-button-add'),
                    onPressed: this.value == this.maxValue
                        ? () => this.onChanged(this.minValue)
                        : () => this.onChanged(this.value + 1),
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
