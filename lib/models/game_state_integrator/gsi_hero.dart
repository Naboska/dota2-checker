class GSIHero {
  late int id;
  late String? name;

  GSIHero.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
