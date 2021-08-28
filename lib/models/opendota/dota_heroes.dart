class DotaHeroes {
  late int id;
  late String name;
  late String localizedName;
  late String primaryAttr;
  late String attackType;
  late List<String> roles;
  late int legs;

  DotaHeroes(
      {required this.id,
      required this.name,
      required this.localizedName,
      required this.primaryAttr,
      required this.attackType,
      required this.roles,
      required this.legs});

  DotaHeroes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localized_name'];
    primaryAttr = json['primary_attr'];
    attackType = json['attack_type'];
    roles = json['roles'].cast<String>();
    legs = json['legs'];
  }
}
