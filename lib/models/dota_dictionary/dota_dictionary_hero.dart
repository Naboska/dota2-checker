class DotaDictionaryHero {
  late int id;
  late String name;
  late String localizedName;
  late String primaryAttr;
  late String attackType;
  late List<String> roles;
  late String img;
  late String icon;
  late int baseHealth;
  late double baseHealthRegen;
  late int baseMana;
  late double baseManaRegen;
  late double baseArmor;
  late int baseMr;
  late int baseAttackMin;
  late int baseAttackMax;
  late int baseStr;
  late int baseAgi;
  late int baseInt;
  late double strGain;
  late double agiGain;
  late double intGain;
  late int attackRange;
  late int projectileSpeed;
  late double attackRate;
  late int moveSpeed;
  late double? turnRate;
  late bool cmEnabled;
  late int legs;

  DotaDictionaryHero.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localized_name'];
    primaryAttr = json['primary_attr'];
    attackType = json['attack_type'];
    roles = json['roles'].cast<String>();
    img = json['img'];
    icon = json['icon'];
    baseHealth = json['base_health'];
    baseHealthRegen = json['base_health_regen'].toDouble();
    baseMana = json['base_mana'];
    baseManaRegen = json['base_mana_regen'].toDouble();
    baseArmor = json['base_armor'].toDouble();
    baseMr = json['base_mr'];
    baseAttackMin = json['base_attack_min'];
    baseAttackMax = json['base_attack_max'];
    baseStr = json['base_str'];
    baseAgi = json['base_agi'];
    baseInt = json['base_int'];
    strGain = json['str_gain'].toDouble();
    agiGain = json['agi_gain'].toDouble();
    intGain = json['int_gain'].toDouble();
    attackRange = json['attack_range'];
    projectileSpeed = json['projectile_speed'];
    attackRate = json['attack_rate'].toDouble();
    moveSpeed = json['move_speed'];
    turnRate = json['turn_rate']?.toDouble();
    cmEnabled = json['cm_enabled'];
    legs = json['legs'];
  }
}