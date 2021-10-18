import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:dota2checker/constants/theme.dart';
import 'package:dota2checker/widgets/situation_widget/situation_widget.dart';
import 'package:dota2checker/controllers/dota_dictionary/dota_dictionary_controller.dart';

import 'units/game_side_widget.dart';
import 'models/last_game.dart';

class GamePlayersWidget extends StatefulWidget {
  const GamePlayersWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GameGamePlayersState();
}

class _GameGamePlayersState extends State<GamePlayersWidget> {
  final DotaDictionaryController _c = Get.find();
  Timer? _gameCheckTimer;
  LastGame? _lastGame;

  Future<void> _read() async {
    File file = File('${_c.dictionary!.path}/dota/server_log.txt');
    String serverConfig = await file.readAsString();
    LastGame newGame = LastGame(serverConfig: serverConfig);

    if (newGame.gameTime != _lastGame?.gameTime) {
      setState(() => _lastGame = newGame);
    }
  }

  @override
  void initState() {
    _read();

    _gameCheckTimer =
        Timer.periodic(const Duration(seconds: 5), (timer) => _read());

    super.initState();
  }

  @override
  void dispose() {
    _gameCheckTimer!.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isGameTurbo = _lastGame?.isTurbo ?? false;
    final bool isRadiantNotEmpty =
        _lastGame?.radiant != null && _lastGame!.radiant.isNotEmpty;
    final bool isDireNotEmpty =
        _lastGame?.dire != null && _lastGame!.dire.isNotEmpty;

    return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        child: Flexible(
            child: Column(children: [
          SituationWidget(
              isRender: isRadiantNotEmpty,
              child: () => GameSideWidget(
                    side: 'The Radiant',
                    sideColor: radiantColor,
                    players: _lastGame?.radiant,
                    isTurbo: isGameTurbo,
                  )),
          SituationWidget(
              isRender: isDireNotEmpty,
              child: () => GameSideWidget(
                    side: 'The Dire',
                    sideColor: direColor,
                    players: _lastGame?.dire,
                    isTurbo: isGameTurbo,
                  ))
        ], crossAxisAlignment: CrossAxisAlignment.start)));
  }
}
