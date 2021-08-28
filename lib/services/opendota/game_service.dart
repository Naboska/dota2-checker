import 'dart:convert';

import 'package:dota2checker/models/opendota/dota_heroes.dart';

import 'opendota_http.dart';

class GameService extends OpenDotaHttp {
  Future<List<DotaHeroes>> getHeroes() async {
    final response = await getRequest('/heroes');

    switch (response.statusCode) {
      case 200:
        final List<dynamic> result = json.decode(response.body);
        return result.map((item) => DotaHeroes.fromJson(item)).toList();
      case 404:
        throw Exception('Ошибка получения 404');
      default:
        throw Exception('Ошибка получения.');
    }
  }
}