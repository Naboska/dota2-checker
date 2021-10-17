class GameStateIntegrator {
  late GSIBuildings? buildings;
  late GSIProvider provider;
  late GSIMap? map;
  late GSIPlayer player;
  late GSIHero? hero;
  late dynamic abilities;
  late dynamic items;
  late dynamic draft;
  late dynamic wearables;

  GameStateIntegrator(
      {required this.buildings,
      required this.provider,
      required this.map,
      required this.player,
      required this.hero,
      required this.abilities,
      required this.items,
      required this.draft,
      required this.wearables});

  GameStateIntegrator.fromJson(Map<String, dynamic> json) {
    var jsonBuildings = json['buildings'];
    var jsonMap = json['map'];
    var jsonHero = json['hero'];

    buildings = jsonBuildings != null ? GSIBuildings.fromJson(jsonBuildings) : null;
    provider = GSIProvider.fromJson(json['provider']);
    map = jsonMap != null ? GSIMap.fromJson(jsonMap) : null;
    player = GSIPlayer.fromJson(json['player']);
    hero = jsonHero != null ? GSIHero.fromJson(jsonHero) : null;
  }
}

//TODO
class GSIBuilding {
  GSIBuilding.fromJson(Map<String, dynamic> json) {
    //TODO
  }
}

class GSIBuildings {
  GSIBuilding? radiant;
  GSIBuilding? dire;

  GSIBuildings.fromJson(Map<String, dynamic> json) {
    final jsonRadiant = json['radiant'];
    final jsonDire = json['dire'];

    if (jsonRadiant != null) radiant = GSIBuilding.fromJson(jsonRadiant);
    if (jsonDire != null) dire = GSIBuilding.fromJson(jsonDire);
  }
}

class GSIProvider {
  late String name;
  late int appid;
  late int version;
  late int timestamp;

  GSIProvider(
      {required this.name,
      required this.appid,
      required this.version,
      required this.timestamp});

  GSIProvider.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    appid = json['appid'];
    version = json['version'];
    timestamp = json['timestamp'];
  }
}

class GSIMap {
  late String name;
  late int matchid;
  late int game_time;
  late int clock_time;
  late bool daytime;
  late bool nightstalker_night;
  late String game_state;
  late bool paused;
  late String win_team;
  late String customgamename;
  late int ward_purchase_cooldown;

  GSIMap({
    required this.name,
    required this.matchid,
    required this.game_time,
    required this.clock_time,
    required this.daytime,
    required this.nightstalker_night,
    required this.game_state,
    required this.paused,
    required this.win_team,
    required this.customgamename,
    required this.ward_purchase_cooldown,
  });

  GSIMap.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    matchid = int.parse(json['matchid']);
    game_time = json['game_time'];
    clock_time = json['clock_time'];
    daytime = json['daytime'];
    nightstalker_night = json['nightstalker_night'];
    game_state = json['game_state'];
    paused = json['paused'];
    win_team = json['win_team'];
    customgamename = json['customgamename'];
    ward_purchase_cooldown = json['ward_purchase_cooldown'];
  }
}

class GSIPlayer {
  late String steamid;
  late String name;
  late String activity;
  late int kills;
  late int deaths;
  late int assists;
  late int last_hits;
  late int denies;
  late int kill_streak;
  late int commands_issued;
  late String team_name;
  late int gold;
  late int gold_reliable;
  late int gold_unreliable;
  late int gold_from_hero_kills;
  late int gold_from_creep_kills;
  late int gold_from_income;
  late int gold_from_shared;
  late int gpm;
  late int xpm;

  GSIPlayer(
      {required this.steamid,
      required this.name,
      required this.activity,
      required this.kills,
      required this.deaths,
      required this.assists,
      required this.last_hits,
      required this.denies,
      required this.kill_streak,
      required this.commands_issued,
      required this.team_name,
      required this.gold,
      required this.gold_reliable,
      required this.gold_unreliable,
      required this.gold_from_hero_kills,
      required this.gold_from_creep_kills,
      required this.gold_from_income,
      required this.gold_from_shared,
      required this.gpm,
      required this.xpm});

  GSIPlayer.fromJson(Map<String, dynamic> json) {
    steamid = json['steamid'];
    name = json['name'];
    activity = json['activity'];
    kills = json['kills'];
    deaths = json['deaths'];
    assists = json['assists'];
    last_hits = json['last_hits'];
    denies = json['denies'];
    kill_streak = json['kill_streak'];
    commands_issued = json['commands_issued'];
    team_name = json['team_name'];
    gold = json['gold'];
    gold_reliable = json['gold_reliable'];
    gold_unreliable = json['gold_unreliable'];
    gold_from_hero_kills = json['gold_from_hero_kills'];
    gold_from_creep_kills = json['gold_from_creep_kills'];
    gold_from_income = json['gold_from_income'];
    gold_from_shared = json['gold_from_shared'];
    gpm = json['gpm'];
    xpm = json['xpm'];
  }
}

class GSIHero {
  late int id;
  late String name;

  GSIHero({required this.id, required this.name});

  GSIHero.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
