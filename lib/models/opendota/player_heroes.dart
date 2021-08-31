class PlayerHeroes {
  late String heroId;
  late int lastPlayed;
  late int games;
  late int win;
  late int withGames;
  late int withWin;
  late int againstGames;
  late int againstWin;

  PlayerHeroes(
      {required this.heroId,
        required this.lastPlayed,
        required this.games,
        required this.win,
        required this.withGames,
        required this.withWin,
        required this.againstGames,
        required this.againstWin});

  PlayerHeroes.fromJson(Map<String, dynamic> json) {
    heroId = json['hero_id'];
    lastPlayed = json['last_played'];
    games = json['games'];
    win = json['win'];
    withGames = json['with_games'];
    withWin = json['with_win'];
    againstGames = json['against_games'];
    againstWin = json['against_win'];
  }
}
