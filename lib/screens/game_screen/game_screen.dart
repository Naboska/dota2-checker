import 'package:flutter/material.dart';

import 'widgets/game_player_widget/game_player_widget.dart';
import 'widgets/game_players_widget/game_players_widget.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dota 2 Checker'),
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(children: const <Widget>[
                  // GamePlayerWidget(),
                   GamePlayersWidget()
              ])),
        )));
  }
}
