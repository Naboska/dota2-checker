import 'package:flutter/material.dart';

import '../../player_info_widget/player_info_widget.dart';

class GameSideWidget extends StatelessWidget {
  final String side;
  final Color sideColor;
  final List<int>? players;
  final bool isTurbo;

  const GameSideWidget(
      {Key? key,
      this.players,
      required this.side,
      required this.sideColor,
      required this.isTurbo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
              child: Text(side,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: sideColor)))),
      Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
              height: 375,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    final int currentId = players![i];

                    return Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: PlayerInfoWidget(
                          key: Key(currentId.toString()),
                          playerId: currentId,
                          isTurbo: isTurbo,
                        ));
                  },
                  itemCount: players?.length ?? 0)))
    ]);
  }
}
