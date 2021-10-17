class DotaDictionaryItem {
  late int id;
  late String img;
  late String? dname;

  DotaDictionaryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    dname = json['dname'];
  }
}
