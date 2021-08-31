import 'dart:convert';

import 'package:dota2checker/models/opendota/player_heroes.dart';
import 'package:dota2checker/models/opendota/player_info_entity.dart';
import 'package:dota2checker/models/opendota/player_peer_entity.dart';
import 'package:dota2checker/models/opendota/player_recent_match.dart';
import 'package:dota2checker/models/opendota/player_statistic.dart';

import 'opendota_http.dart';

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

  Future<PlayerStatistic> getGameStatistic({required int id}) async {
    final response = await getRequest('/players/$id/wl?significant=0&game_mode=23');

    switch (response.statusCode) {
      case 200:
        var result = json.decode(response.body);
        return PlayerStatistic.fromJson(result);
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

  Future<List<PlayerRecentMatch>> getRecentMatches({required int id}) async {
    final response = await getRequest('/players/$id/recentMatches?significant=0&game_mode=23');

    switch (response.statusCode) {
      case 200:
        final List<dynamic> result = json.decode(response.body);
        return result.map((item) => PlayerRecentMatch.fromJson(item)).toList();
      case 404:
        throw Exception('Ошибка получения 404');
      default:
        throw Exception('Ошибка получения.');
    }
  }

  Future<List<PlayerHeroes>> getPlayerHeroes({required int id}) async {
    final response = await getRequest('/players/$id/heroes?significant=0&game_mode=23');

    switch (response.statusCode) {
      case 200:
        final List<dynamic> result = json.decode(response.body);
        return result.map((item) => PlayerHeroes.fromJson(item)).toList();
      case 404:
        throw Exception('Ошибка получения 404');
      default:
        throw Exception('Ошибка получения.');
    }
  }
}
