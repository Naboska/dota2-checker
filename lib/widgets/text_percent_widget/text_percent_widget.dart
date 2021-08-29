import 'package:flutter/material.dart';

class TextPercentWidget extends StatelessWidget {
  final double percent;

  const TextPercentWidget({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${percent.toStringAsFixed(2)}%',
        style: TextStyle(
            color:
                HSLColor.fromAHSL(1, percent.toDouble(), 1.0, 0.4).toColor()));
  }
}
