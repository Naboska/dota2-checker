import 'dart:convert';

import '../../models/opendota/player_info_entity.dart';
import './opendota_http.dart';

class PlayerInfoService extends OpenDotaHttp {
  Future<PlayerInfo> getPlayerInfo({required int id}) async {
    final response = await getRequest('/players/$id');

    switch (response.statusCode) {
      case 200:
        var result = json.decode(response.body);
        return PlayerInfo.fromJson(result);
      case 404:
        throw Exception('Ошибка получения 404');
      default:
        throw Exception('Ошибка получения.');
    }
  }
}
