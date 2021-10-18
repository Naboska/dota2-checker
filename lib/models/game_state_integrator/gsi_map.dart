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

