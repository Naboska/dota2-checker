class PlayerRecentMatch {
  late int matchId;
  late int playerSlot;
  late bool radiantWin;
  late int gameMode;
  late int heroId;
  late int startTime;
  late int duration;
  late int lobbyType;
  late int kills;
  late int deaths;
  late int assists;
  late int? skill;
  late int xpPerMin;
  late int goldPerMin;
  late int heroDamage;
  late int towerDamage;
  late int heroHealing;
  late int lastHits;
  late int cluster;
  late int leaverStatus;
  late int? partySize;

  PlayerRecentMatch(
      {required this.matchId,
      required this.playerSlot,
      required this.radiantWin,
      required this.gameMode,
      required this.heroId,
      required this.startTime,
      required this.duration,
      required this.lobbyType,
      required this.kills,
      required this.deaths,
      required this.assists,
      required this.skill,
      required this.xpPerMin,
      required this.goldPerMin,
      required this.heroDamage,
      required this.towerDamage,
      required this.heroHealing,
      required this.lastHits,
      required this.cluster,
      required this.leaverStatus,
      required this.partySize});

  PlayerRecentMatch.fromJson(Map<String, dynamic> json) {
    matchId = json['match_id'];
    playerSlot = json['player_slot'];
    radiantWin = json['radiant_win'];
    gameMode = json['game_mode'];
    heroId = json['hero_id'];
    startTime = json['start_time'];
    duration = json['duration'];
    lobbyType = json['lobby_type'];
    kills = json['kills'];
    deaths = json['deaths'];
    assists = json['assists'];
    skill = json['skill'];
    xpPerMin = json['xp_per_min'];
    goldPerMin = json['gold_per_min'];
    heroDamage = json['hero_damage'];
    towerDamage = json['tower_damage'];
    heroHealing = json['hero_healing'];
    lastHits = json['last_hits'];
    cluster = json['cluster'];
    leaverStatus = json['leaver_status'];
    partySize = json['party_size'];
  }
}
