import 'package:dota2checker/models/game_state_integrator/game_state_integrator.dart';
import 'package:flutter/material.dart';

import 'game_map_item_widget.dart';

class GameMapWidget extends StatelessWidget {
  final GSIBuilding buildings;
  final GSIBuilding? prevBuildings;
  final String side;

  const GameMapWidget({Key? key, required this.buildings, required this.side, this.prevBuildings}) : super(key: key);

  _checkEqual(GSIBuildingHealth? first, GSIBuildingHealth? last) {
    if (first == null || last == null) return false;

    return first.healthPercent < last.healthPercent;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: SizedBox(
            width: 300,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(4)),
              child: Stack(children: <Widget>[
                GameMapItemWidget(
                    building: buildings.t1Top,
                    left: 27,
                    vertical: 30,
                    side: side,
                    isPulse: _checkEqual(buildings.t1Top, prevBuildings?.t1Top)),
                GameMapItemWidget(
                    building: buildings.t1Mid,
                    left: 139,
                    vertical: 30,
                    side: side,
                    isPulse: _checkEqual(buildings.t1Mid, prevBuildings?.t1Mid)),
                GameMapItemWidget(
                    building: buildings.t1Bot,
                    left: 250,
                    vertical: 30,
                    side: side,
                    isPulse: _checkEqual(buildings.t1Bot, prevBuildings?.t1Bot)),
                GameMapItemWidget(
                    building: buildings.t2Top,
                    left: 27,
                    vertical: 82,
                    side: side,
                    isPulse: _checkEqual(buildings.t2Top, prevBuildings?.t2Top)),
                GameMapItemWidget(
                    building: buildings.t2Mid,
                    left: 139,
                    vertical: 82,
                    side: side,
                    isPulse: _checkEqual(buildings.t2Mid, prevBuildings?.t2Mid)),
                GameMapItemWidget(
                    building: buildings.t2Bot,
                    left: 250,
                    vertical: 82,
                    side: side,
                    isPulse: _checkEqual(buildings.t2Bot, prevBuildings?.t2Bot)),
                GameMapItemWidget(
                    building: buildings.t3Top,
                    left: 27,
                    vertical: 134,
                    side: side,
                    isPulse: _checkEqual(buildings.t3Top, prevBuildings?.t3Top)),
                GameMapItemWidget(
                    building: buildings.t3Mid,
                    left: 139,
                    vertical: 134,
                    side: side,
                    isPulse: _checkEqual(buildings.t3Mid, prevBuildings?.t3Mid)),
                GameMapItemWidget(
                    building: buildings.t3Bot,
                    left: 250,
                    vertical: 134,
                    side: side,
                    isPulse: _checkEqual(buildings.t3Bot, prevBuildings?.t3Bot)),
                GameMapItemWidget(
                    building: buildings.t4Top,
                    left: 113,
                    vertical: 240,
                    side: side,
                    isPulse: _checkEqual(buildings.t4Top, prevBuildings?.t4Top)),
                GameMapItemWidget(
                    building: buildings.t4Bot,
                    left: 163,
                    vertical: 240,
                    side: side,
                    isPulse: _checkEqual(buildings.t4Bot, prevBuildings?.t4Bot)),
                GameMapItemWidget(
                    building: buildings.raxRangeTop,
                    left: 13,
                    vertical: 186,
                    side: side,
                    isPulse: _checkEqual(buildings.raxRangeTop, prevBuildings?.raxRangeTop)),
                GameMapItemWidget(
                    building: buildings.raxRangeMid,
                    left: 123,
                    vertical: 186,
                    side: side,
                    isPulse: _checkEqual(buildings.raxRangeMid, prevBuildings?.raxRangeMid)),
                GameMapItemWidget(
                    building: buildings.raxRangeBot,
                    left: 233,
                    vertical: 186,
                    side: side,
                    isPulse: _checkEqual(buildings.raxRangeBot, prevBuildings?.raxRangeBot)),
                GameMapItemWidget(
                    building: buildings.raxMeleeTop,
                    left: 45,
                    vertical: 186,
                    side: side,
                    isPulse: _checkEqual(buildings.raxMeleeTop, prevBuildings?.raxMeleeTop)),
                GameMapItemWidget(
                    building: buildings.raxMeleeMid,
                    left: 155,
                    vertical: 186,
                    side: side,
                    isPulse: _checkEqual(buildings.raxMeleeMid, prevBuildings?.raxMeleeMid)),
                GameMapItemWidget(
                    building: buildings.raxMeleeBot,
                    left: 265,
                    vertical: 186,
                    side: side,
                    isPulse: _checkEqual(buildings.raxMeleeBot, prevBuildings?.raxMeleeBot)),
              ]),
            )));
  }
}
