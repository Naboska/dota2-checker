import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../utils/dota_directory.dart';
import '../../constants/theme.dart';
import 'models/last_game.dart';
import 'widgets/game_side_widget/game_side_widget.dart';

class GameScreen extends StatefulWidget {
  final dotaDirectory = DotaDirectory();

  GameScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Timer? gameCheckTimer;
  LastGame? lastGame;

  Future<void> _read() async {
    try {
      String? dotaDir = await widget.dotaDirectory.getDotaDirectory();
      File file = File('$dotaDir/game/dota/server_log.txt');
      String serverConfig = await file.readAsString();
      LastGame newGame = LastGame.fromServerConfig(serverConfig: serverConfig);

      if (newGame.lobby != lastGame?.lobby) {
        setState(() => lastGame = newGame);
      }
    } catch (_) {}
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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dota 2 Checker'),
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(children: [
                        const Text('Лобби:',
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 15)),
                        Text(' ${lastGame?.lobby ?? 'не найдено'}')
                      ])),
                  GameSideWidget(
                      side: 'The Radiant',
                      sideColor: radiantColor,
                      players: lastGame?.radiant),
                  GameSideWidget(
                      side: 'The Dire',
                      sideColor: direColor,
                      players: lastGame?.dire),
                ]))));
  }
}
