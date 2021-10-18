class GSIProvider {
  late String name;
  late int appid;
  late int version;
  late int timestamp;

  GSIProvider.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    appid = json['appid'];
    version = json['version'];
    timestamp = json['timestamp'];
  }
}
