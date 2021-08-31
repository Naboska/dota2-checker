import 'package:flutter/material.dart';

class TextPercentWidget extends StatelessWidget {
  final double percent;
  final double? fontSize;

  const TextPercentWidget({Key? key, required this.percent, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isEmpty = percent.isNaN;

    if (isEmpty) return Container();

    return Text('${percent.toStringAsFixed(2)}%',
        style: TextStyle(
          fontSize: fontSize,
            color:
                HSLColor.fromAHSL(1, percent, 1.0, 0.4).toColor()));
  }
}
