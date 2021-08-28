class PlayerPeer {
  late int accountId;
  late int lastPlayed;
  late int win;
  late int games;
  late int withWin;
  late int withGames;
  late int againstWin;
  late int againstGames;
  late int withGpmSum;
  late int withXpmSum;
  late String personaname;
  late bool isContributor;
  late String avatar;
  late String avatarfull;

  PlayerPeer(
      {required this.accountId,
        required this.lastPlayed,
        required this.win,
        required this.games,
        required this.withWin,
        required this.withGames,
        required this.againstWin,
        required this.againstGames,
        required this.withGpmSum,
        required this.withXpmSum,
        required this.personaname,
        required this.isContributor,
        required this.avatar,
        required this.avatarfull});

  PlayerPeer.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    lastPlayed = json['last_played'];
    win = json['win'];
    games = json['games'];
    withWin = json['with_win'];
    withGames = json['with_games'];
    againstWin = json['against_win'];
    againstGames = json['against_games'];
    withGpmSum = json['with_gpm_sum'];
    withXpmSum = json['with_xpm_sum'];
    personaname = json['personaname'];
    isContributor = json['is_contributor'];
    avatar = json['avatar'];
    avatarfull = json['avatarfull'];
  }
}
