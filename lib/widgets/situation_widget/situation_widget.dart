import 'package:flutter/material.dart';

class SituationWidget extends StatelessWidget {
  final bool isRender;
  final Widget Function() child;

  const SituationWidget({Key? key, required this.child, required this.isRender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isRender ? child() : Container();
  }
}
