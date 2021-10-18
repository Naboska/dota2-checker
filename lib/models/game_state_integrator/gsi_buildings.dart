class GSIBuildingHealth {
  late int health;
  late int maxHealth;
  late double healthPercent;

  GSIBuildingHealth.fromJson(Map<String, dynamic>? json) {
    health = json?['health'] ?? 0;
    maxHealth = json?['max_health'] ?? 0;
    healthPercent = maxHealth > 0 ? health / maxHealth  * 100 : 0;
  }
}

class GSIBuilding {
  late GSIBuildingHealth t1Mid;
  late GSIBuildingHealth t2Mid;
  late GSIBuildingHealth t3Mid;
  late GSIBuildingHealth t1Bot;
  late GSIBuildingHealth t2Bot;
  late GSIBuildingHealth t3Bot;
  late GSIBuildingHealth t4Bot;
  late GSIBuildingHealth t1Top;
  late GSIBuildingHealth t2Top;
  late GSIBuildingHealth t3Top;
  late GSIBuildingHealth t4Top;
  late GSIBuildingHealth raxMeleeTop;
  late GSIBuildingHealth raxRangeTop;
  late GSIBuildingHealth raxMeleeMid;
  late GSIBuildingHealth raxRangeMid;
  late GSIBuildingHealth raxMeleeBot;
  late GSIBuildingHealth raxRangeBot;

  GSIBuilding.fromJson(Map<String, dynamic> json) {
    t1Mid = GSIBuildingHealth.fromJson(json['dota_goodguys_tower1_mid']);
    t2Mid = GSIBuildingHealth.fromJson(json['dota_goodguys_tower2_mid']);
    t3Mid = GSIBuildingHealth.fromJson(json['dota_goodguys_tower3_mid']);
    t1Bot = GSIBuildingHealth.fromJson(json['dota_goodguys_tower1_bot']);
    t2Bot = GSIBuildingHealth.fromJson(json['dota_goodguys_tower2_bot']);
    t3Bot = GSIBuildingHealth.fromJson(json['dota_goodguys_tower3_bot']);
    t4Bot = GSIBuildingHealth.fromJson(json['dota_goodguys_tower4_bot']);
    t1Top = GSIBuildingHealth.fromJson(json['dota_goodguys_tower1_top']);
    t2Top = GSIBuildingHealth.fromJson(json['dota_goodguys_tower2_top']);
    t3Top = GSIBuildingHealth.fromJson(json['dota_goodguys_tower3_top']);
    t4Top = GSIBuildingHealth.fromJson(json['dota_goodguys_tower4_top']);
    raxMeleeTop = GSIBuildingHealth.fromJson(json['good_rax_melee_top']);
    raxRangeTop = GSIBuildingHealth.fromJson(json['good_rax_range_top']);
    raxMeleeMid = GSIBuildingHealth.fromJson(json['good_rax_melee_mid']);
    raxRangeMid = GSIBuildingHealth.fromJson(json['good_rax_range_mid']);
    raxMeleeBot = GSIBuildingHealth.fromJson(json['good_rax_melee_bot']);
    raxRangeBot = GSIBuildingHealth.fromJson(json['good_rax_range_bot']);
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

