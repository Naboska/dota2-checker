import 'dart:convert';

import '../../models/opendota/player_info_entity.dart';
import '../../models/opendota/player_peer_entity.dart';
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

  Future<List<PlayerPeer>> getPlayerPeers({required int id}) async {
    final response = await getRequest('/players/$id/peers?significant=0&game_mode=23');

    switch (response.statusCode) {
      case 200:
        final List<dynamic> result = json.decode(response.body);
        return result.map((item) => PlayerPeer.fromJson(item)).toList();
      case 404:
        throw Exception('Ошибка получения 404');
      default:
        throw Exception('Ошибка получения.');
    }
  }
}
