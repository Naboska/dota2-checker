import 'dart:math';

import 'package:dota2checker/utils/numeric_safe_parser.dart';

const findGames = ['DOTA_GAMEMODE_TURBO', 'DOTA_GAMEMODE_1V1MID', 'DOTA_GAMEMODE_ABILITY_DRAFT'];
const minPlayerIndex = 7;
const maxPlayerIndex = 16;
const endTimeIndex = 21;

class LastGame {
  List<int> radiant = [];
  List<int> dire = [];
  String? lobby;
  String? gameTime;

  LastGame.fromServerConfig({required String serverConfig}) {
    final List<String> textList = serverConfig.split('\r\n');
    late String? last;

    for (int i = textList.length - 1; i != 0; i--) {
      final String current = textList[i];
      final bool isCurrentCorrectGame =
          findGames.any((game) => current.contains(game));

      if (isCurrentCorrectGame) {
        final int pos = current.lastIndexOf('Party');
        last = pos != -1 ? current.substring(0, pos) : current;
        break;
      }
    }

    if (last != null) {
      final List<String> gameInfo = last.split(' ');
      final int correctRange = min(gameInfo.length - 1, maxPlayerIndex);

      List<int> newRadiant = [];
      List<int> newDire = [];

      for (int i = minPlayerIndex; i <= correctRange; i++) {
        final String? player = gameInfo[i];
        final num? playerSlot = numericSafeParser(player?[0]);

        if (playerSlot != null) {
          List<int> currentList = playerSlot <= 4 ? newRadiant : newDire;
          int? parsePlayer = _parsePlayer(player: player!);
          if (parsePlayer != null) currentList.add(parsePlayer);
        }
      }

      radiant = newRadiant;
      dire = newDire;
      gameTime = last.substring(0, endTimeIndex);
      lobby = gameInfo[5];
    }
  }

  int? _parsePlayer({required String player}) {
    bool isCorrect = player.contains('U:1:');

    if (isCorrect) {
      RegExp intRgx = RegExp(r"[^0-9]+");
      String processed = player.substring(7).replaceAll(intRgx, '');

      return int.parse(processed);
    }

    return null;
  }
}
