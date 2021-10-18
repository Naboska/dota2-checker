import 'package:dota2checker/controllers/game_state_integrator/game_state_integrator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GSIConsumer extends StatelessWidget {
  final Widget Function(
      BuildContext context,
      GSIController value,
      Widget? child,
      ) builder;

  const GSIConsumer({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GSIController>(builder: builder);
  }
}
