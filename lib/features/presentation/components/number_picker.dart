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
              style: Theme.of(context).textTheme.headline6,
            ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: this.value == this.minValue
                      ? () => this.onChanged(this.maxValue)
                      : () => this.onChanged(this.value - 1),
                  child: const Icon(Icons.arrow_back),
                  style: TextButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  this.value.toString(),
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: this.value == this.maxValue
                      ? () => this.onChanged(this.minValue)
                      : () => this.onChanged(this.value + 1),
                  child: const Icon(Icons.arrow_forward),
                  style: TextButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
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
