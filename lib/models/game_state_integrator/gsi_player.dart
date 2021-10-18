class GSIPlayer {
  late String steamid;
  late String name;
  late String activity;
  late int kills;
  late int deaths;
  late int assists;
  late int lastHits;
  late int denies;
  late int killStreak;
  late int commandsIssued;
  late String teamName;
  late int gold;
  late int goldReliable;
  late int goldUnreliable;
  late int goldFromHeroKills;
  late int goldFromCreepKills;
  late int goldFromIncome;
  late int goldFromShared;
  late int gpm;
  late int xpm;

  GSIPlayer.fromJson(Map<String, dynamic> json) {
    steamid = json['steamid'];
    name = json['name'];
    activity = json['activity'];
    kills = json['kills'];
    deaths = json['deaths'];
    assists = json['assists'];
    lastHits = json['last_hits'];
    denies = json['denies'];
    killStreak = json['kill_streak'];
    commandsIssued = json['commands_issued'];
    teamName = json['team_name'];
    gold = json['gold'];
    goldReliable = json['gold_reliable'];
    goldUnreliable = json['gold_unreliable'];
    goldFromHeroKills = json['gold_from_hero_kills'];
    goldFromCreepKills = json['gold_from_creep_kills'];
    goldFromIncome = json['gold_from_income'];
    goldFromShared = json['gold_from_shared'];
    gpm = json['gpm'];
    xpm = json['xpm'];
  }
}
