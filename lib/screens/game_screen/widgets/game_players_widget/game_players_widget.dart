import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:dota2checker/utils/dota.dart';
import 'package:dota2checker/constants/theme.dart';
import 'package:dota2checker/widgets/situation_widget/situation_widget.dart';
import 'package:dota2checker/controllers/dota_dictionary/dota_dictionary_controller.dart';

import 'units/game_side_widget.dart';
import './models/last_game.dart';

class GamePlayersWidget extends StatefulWidget {
  const GamePlayersWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GameGamePlayersState();
}

class _GameGamePlayersState extends State<GamePlayersWidget> {
  final DotaDictionaryController dictController = Get.find();
  Timer? gameCheckTimer;
  LastGame? lastGame;

  Future<void> _read() async {
    String? dotaDir = await Dota.getDirectory();
    File file = File('$dotaDir/dota/server_log.txt');
    String serverConfig = await file.readAsString();
    LastGame newGame = LastGame(serverConfig: serverConfig);

    if (newGame.gameTime != lastGame?.gameTime) {
      setState(() => lastGame = newGame);
    }
  }

  @override
  void initState() {
    _read();

    gameCheckTimer =
        Timer.periodic(const Duration(seconds: 5), (timer) => _read());

    super.initState();
  }

  @override
  void dispose() {
    gameCheckTimer!.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isGameTurbo = lastGame?.isTurbo ?? false;
    final bool isRadiantNotEmpty =
        lastGame?.radiant != null && lastGame!.radiant.isNotEmpty;
    final bool isDireNotEmpty =
        lastGame?.dire != null && lastGame!.dire.isNotEmpty;

    return Column(children: [
      SituationWidget(
          isRender: isRadiantNotEmpty,
          child: () => GameSideWidget(
                side: 'The Radiant',
                sideColor: radiantColor,
                players: lastGame?.radiant,
                isTurbo: isGameTurbo,
              )),
      SituationWidget(
          isRender: isDireNotEmpty,
          child: () => GameSideWidget(
                side: 'The Dire',
                sideColor: direColor,
                players: lastGame?.dire,
                isTurbo: isGameTurbo,
              ))
    ]);
  }
}
