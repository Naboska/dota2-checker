class DotaDictionaryAbilities {
  late String? img;
  late String? dname;

  DotaDictionaryAbilities.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    dname = json['dname'];
  }
}
