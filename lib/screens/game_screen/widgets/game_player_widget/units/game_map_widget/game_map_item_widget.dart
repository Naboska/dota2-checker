import 'package:dota2checker/models/game_state_integrator/gsi_buildings.dart';
import 'package:dota2checker/widgets/situation_widget/situation_widget.dart';
import 'package:flutter/material.dart';

class GameMapItemWidget extends StatefulWidget {
  final GSIBuildingHealth building;
  final int vertical;
  final int left;
  final String side;
  final bool isPulse;

  const GameMapItemWidget(
      {Key? key,
      required this.left,
      required this.vertical,
      required this.side,
      required this.isPulse,
      required this.building})
      : super(key: key);

  @override
  createState() => _GameMapItemState();
}

class _GameMapItemState extends State<GameMapItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _animation = Tween(begin: 1.0, end: 5.0).animate(_animationController)
      ..addListener(_updateItemListener);
    _animationController.repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    _animation.removeListener(_updateItemListener);
    _animationController.stop();
    _animationController.dispose();

    super.dispose();
  }

  _updateItemListener() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final bool isRadiant = widget.side == 'radiant';
    final double itemHeight = 25 * (widget.building.healthPercent / 100);

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
                          boxShadow: widget.isPulse
                              ? <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.red,
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
              SituationWidget(
                  child: () => Text('${widget.building.health}',
                      style: TextStyle(
                          fontSize: 11,
                          color: HSLColor.fromAHSL(
                                  1, widget.building.healthPercent, 1.0, 0.4)
                              .toColor())),
                  isRender: !<double>[0, 100].contains(widget.building.healthPercent))
            ]));
  }
}
