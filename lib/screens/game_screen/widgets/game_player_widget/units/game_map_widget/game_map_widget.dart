import 'package:flutter/material.dart';

import 'package:dota2checker/constants/theme.dart';
import 'package:dota2checker/models/game_state_integrator/game_state_integrator.dart';

import 'game_map_item_widget.dart';

class GameMapWidget extends StatelessWidget {
  final GSIBuilding buildings;
  final GSIBuilding? prevBuildings;
  final String side;

  const GameMapWidget(
      {Key? key, required this.buildings, required this.side, this.prevBuildings})
      : super(key: key);

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
            height: 340,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(4)),
              child: Stack(children: <Widget>[
                Positioned(left: 10,
                    top: 10,
                    child: Text(side.toUpperCase(), style: TextStyle(
                        fontWeight: FontWeight.bold, color: side == 'radiant' ? radiantColor : direColor))),
                GameMapItemWidget(
                    building: buildings.t1Top,
                    left: 27,
                    vertical: 10,
                    side: side,
                    isPulse: _checkEqual(
                        buildings.t1Top, prevBuildings?.t1Top)),
                GameMapItemWidget(
                    building: buildings.t1Mid,
                    left: 139,
                    vertical: 10,
                    side: side,
                    isPulse: _checkEqual(
                        buildings.t1Mid, prevBuildings?.t1Mid)),
                GameMapItemWidget(
                    building: buildings.t1Bot,
                    left: 250,
                    vertical: 10,
                    side: side,
                    isPulse: _checkEqual(
                        buildings.t1Bot, prevBuildings?.t1Bot)),
                GameMapItemWidget(
                    building: buildings.t2Top,
                    left: 27,
                    vertical: 65,
                    side: side,
                    isPulse: _checkEqual(
                        buildings.t2Top, prevBuildings?.t2Top)),
                GameMapItemWidget(
                    building: buildings.t2Mid,
                    left: 139,
                    vertical: 65,
                    side: side,
                    isPulse: _checkEqual(
                        buildings.t2Mid, prevBuildings?.t2Mid)),
                GameMapItemWidget(
                    building: buildings.t2Bot,
                    left: 250,
                    vertical: 65,
                    side: side,
                    isPulse: _checkEqual(
                        buildings.t2Bot, prevBuildings?.t2Bot)),
                GameMapItemWidget(
                    building: buildings.t3Top,
                    left: 27,
                    vertical: 120,
                    side: side,
                    isPulse: _checkEqual(
                        buildings.t3Top, prevBuildings?.t3Top)),
                GameMapItemWidget(
                    building: buildings.t3Mid,
                    left: 139,
                    vertical: 120,
                    side: side,
                    isPulse: _checkEqual(
                        buildings.t3Mid, prevBuildings?.t3Mid)),
                GameMapItemWidget(
                    building: buildings.t3Bot,
                    left: 250,
                    vertical: 120,
                    side: side,
                    isPulse: _checkEqual(
                        buildings.t3Bot, prevBuildings?.t3Bot)),
                GameMapItemWidget(
                    building: buildings.t4Top,
                    left: 155,
                    vertical: 240,
                    side: side,
                    isPulse: _checkEqual(
                        buildings.t4Top, prevBuildings?.t4Top)),
                GameMapItemWidget(
                    building: buildings.t4Bot,
                    left: 123,
                    vertical: 240,
                    side: side,
                    isPulse: _checkEqual(
                        buildings.t4Bot, prevBuildings?.t4Bot)),
                GameMapItemWidget(
                    building: buildings.raxRangeTop,
                    left: 13,
                    vertical: 180,
                    side: side,
                    isPulse: _checkEqual(
                        buildings.raxRangeTop, prevBuildings?.raxRangeTop)),
                GameMapItemWidget(
                    building: buildings.raxRangeMid,
                    left: 123,
                    vertical: 180,
                    side: side,
                    isPulse: _checkEqual(
                        buildings.raxRangeMid, prevBuildings?.raxRangeMid)),
                GameMapItemWidget(
                    building: buildings.raxRangeBot,
                    left: 233,
                    vertical: 180,
                    side: side,
                    isPulse: _checkEqual(
                        buildings.raxRangeBot, prevBuildings?.raxRangeBot)),
                GameMapItemWidget(
                    building: buildings.raxMeleeTop,
                    left: 45,
                    vertical: 180,
                    side: side,
                    isPulse: _checkEqual(
                        buildings.raxMeleeTop, prevBuildings?.raxMeleeTop)),
                GameMapItemWidget(
                    building: buildings.raxMeleeMid,
                    left: 155,
                    vertical: 180,
                    side: side,
                    isPulse: _checkEqual(
                        buildings.raxMeleeMid, prevBuildings?.raxMeleeMid)),
                GameMapItemWidget(
                    building: buildings.raxMeleeBot,
                    left: 265,
                    vertical: 180,
                    side: side,
                    isPulse: _checkEqual(
                        buildings.raxMeleeBot, prevBuildings?.raxMeleeBot)),
                GameMapItemWidget(
                    building: buildings.fort,
                    left: 139,
                    vertical: 290,
                    side: side,
                    isPulse: _checkEqual(buildings.fort, prevBuildings?.fort)),
              ]),
            )));
  }
}
