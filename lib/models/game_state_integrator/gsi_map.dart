class GSIMap {
  late String name;
  late int matchid;
  late int gameTime;
  late int clockTime;
  late bool daytime;
  late bool nightstalkerNight;
  late String gameState;
  late bool paused;
  late String winTeam;
  late String customgamename;
  late int? wardPurchaseCooldown;

  GSIMap.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    matchid = int.parse(json['matchid']);
    gameTime = json['game_time'];
    clockTime = json['clock_time'];
    daytime = json['daytime'];
    nightstalkerNight = json['nightstalker_night'];
    gameState = json['game_state'];
    paused = json['paused'];
    winTeam = json['win_team'];
    customgamename = json['customgamename'];
    wardPurchaseCooldown = json['ward_purchase_cooldown'];
  }
}

