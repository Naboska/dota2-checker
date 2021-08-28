const findGames = 'DOTA_GAMEMODE_TURBO';
const minPlayerIndex = 7;
const maxPlayerIndex = 16;

class LastGame {
  List<int>? radiant;
  List<int>? dire;
  int? lobby;

  LastGame({required String serverConfig}) {
    final List<String> textList = serverConfig.split('\r\n');
    late String? last;

    for (int i = textList.length - 1; i != 0; i--) {
      final String current = textList[i];

      if (current.contains(findGames)) {
        last = current;
        break;
      }
    }

    if (last != null) {
      final List<String> gameInfo = last.split(' ');
      List<int> newRadiant = [];
      List<int> newDire = [];

      for (int i = minPlayerIndex; i <= maxPlayerIndex; i++) {
        List<int> currentList = newRadiant.length < 5 ? newRadiant : newDire;
        currentList.add(_parsePlayer(player: gameInfo[i]));
      }

      radiant = newRadiant;
      dire = newDire;

      lobby = int.parse(gameInfo[5]);
    }
  }

  int _parsePlayer({required String player}) {
    RegExp intRgx = RegExp(r"[^0-9]+");
    String processed = player.substring(7).replaceAll(intRgx, '');

    return int.parse(processed);
  }
}
