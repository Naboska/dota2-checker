import 'package:flutter/material.dart';

import 'package:dota2checker/models/game_state_integrator/gsi_buildings.dart';
import 'package:dota2checker/utils/between.dart';

class GameMapItemWidget extends StatefulWidget {
  final GSIBuildingHealth building;
  final int vertical;
  final int left;
  final String side;

  const GameMapItemWidget(
      {Key? key,
      required this.left,
      required this.vertical,
      required this.side,
      required this.building})
      : super(key: key);

  @override
  createState() => _GameMapItemState();
}

class _GameMapItemState extends State<GameMapItemWidget>
    with SingleTickerProviderStateMixin {
  late GSIBuildingHealth _building;
  late AnimationController _animationController;
  late Animation _animation;
  bool _isDenying = false;
  bool _isAttack = false;
  bool _isHealing = false;

  @override
  void initState() {
    _building = widget.building;
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _animation = Tween(begin: 1.0, end: 5.0).animate(_animationController)
      ..addListener(_updateItemListener);
    _animationController.repeat(reverse: true);

    super.initState();
  }

  @override
  void didUpdateWidget(GameMapItemWidget oldWidget) {
    _isDenying = between(widget.building.healthPercent, min: 1, max: 10);
    _isAttack = widget.building.healthPercent < _building.healthPercent;
    _isHealing = widget.building.healthPercent > _building.healthPercent;
    _building = widget.building;

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animation.removeListener(_updateItemListener);
    _animationController.stop();
    _animationController.dispose();

    super.dispose();
  }

  void _updateItemListener() => setState(() {});

  MaterialColor? _getPulseColor() {
    if (_isDenying) return Colors.amber;
    if (_isHealing) return Colors.lightGreen;
    if (_isAttack) return Colors.red;

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final bool isRadiant = widget.side == 'radiant';
    final double itemHeight = 25 * (widget.building.healthPercent / 100);
    final int health = widget.building.health;
    final MaterialColor? pulseColor = _getPulseColor();

    return Positioned(
        top: isRadiant ? widget.vertical.toDouble() : null,
        bottom: !isRadiant ? widget.vertical.toDouble() : null,
        left: widget.left.toDouble(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: 25,
                  height: 25,
                  child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          boxShadow: pulseColor != null
                              ? <BoxShadow>[
                                  BoxShadow(
                                      color: pulseColor,
                                      blurRadius: _animation.value,
                                      spreadRadius: _animation.value)
                                ]
                              : null,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(children: <Widget>[
                        Container(
                            height: itemHeight,
                            color: HSLColor.fromAHSL(
                                    1, widget.building.healthPercent, 1.0, 0.4)
                                .toColor())
                      ], mainAxisAlignment: MainAxisAlignment.end))),
              Text('${health == 0 ? '' : health}',
                  style: TextStyle(
                      fontSize: 11,
                      color: HSLColor.fromAHSL(
                              1, widget.building.healthPercent, 1.0, 0.4)
                          .toColor()))
            ]));
  }
}
