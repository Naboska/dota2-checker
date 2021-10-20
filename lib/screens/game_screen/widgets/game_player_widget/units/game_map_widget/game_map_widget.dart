import 'package:flutter/material.dart';

import 'package:dota2checker/constants/theme.dart';
import 'package:dota2checker/models/game_state_integrator/game_state_integrator.dart';

import 'game_map_item_widget.dart';

class GameMapWidget extends StatelessWidget {
  final GSIBuilding buildings;
  final String side;

  const GameMapWidget({Key? key, required this.buildings, required this.side})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isRadiant = side == 'radiant';

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
                Positioned(
                    left: 10,
                    top: !isRadiant ? 10 : null,
                    bottom: isRadiant ? 10 : null,
                    child: Text(side.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isRadiant ? radiantColor : direColor))),
                GameMapItemWidget(
                  building: buildings.t1Top,
                  left: 27,
                  vertical: 10,
                  side: side,
                ),
                GameMapItemWidget(
                    building: buildings.t1Mid,
                    left: 139,
                    vertical: 10,
                    side: side),
                GameMapItemWidget(
                    building: buildings.t1Bot,
                    left: 250,
                    vertical: 10,
                    side: side),
                GameMapItemWidget(
                  building: buildings.t2Top,
                  left: 27,
                  vertical: 65,
                  side: side,
                ),
                GameMapItemWidget(
                  building: buildings.t2Mid,
                  left: 139,
                  vertical: 65,
                  side: side,
                ),
                GameMapItemWidget(
                  building: buildings.t2Bot,
                  left: 250,
                  vertical: 65,
                  side: side,
                ),
                GameMapItemWidget(
                  building: buildings.t3Top,
                  left: 27,
                  vertical: 120,
                  side: side,
                ),
                GameMapItemWidget(
                  building: buildings.t3Mid,
                  left: 139,
                  vertical: 120,
                  side: side,
                ),
                GameMapItemWidget(
                  building: buildings.t3Bot,
                  left: 250,
                  vertical: 120,
                  side: side,
                ),
                GameMapItemWidget(
                  building: buildings.t4Top,
                  left: 155,
                  vertical: 240,
                  side: side,
                ),
                GameMapItemWidget(
                  building: buildings.t4Bot,
                  left: 123,
                  vertical: 240,
                  side: side,
                ),
                GameMapItemWidget(
                  building: buildings.raxRangeTop,
                  left: 13,
                  vertical: 180,
                  side: side,
                ),
                GameMapItemWidget(
                  building: buildings.raxRangeMid,
                  left: 123,
                  vertical: 180,
                  side: side,
                ),
                GameMapItemWidget(
                  building: buildings.raxRangeBot,
                  left: 233,
                  vertical: 180,
                  side: side,
                ),
                GameMapItemWidget(
                  building: buildings.raxMeleeTop,
                  left: 45,
                  vertical: 180,
                  side: side,
                ),
                GameMapItemWidget(
                  building: buildings.raxMeleeMid,
                  left: 155,
                  vertical: 180,
                  side: side,
                ),
                GameMapItemWidget(
                  building: buildings.raxMeleeBot,
                  left: 265,
                  vertical: 180,
                  side: side,
                ),
                GameMapItemWidget(
                  building: buildings.fort,
                  left: 139,
                  vertical: 290,
                  side: side,
                ),
              ]),
            )));
  }
}
