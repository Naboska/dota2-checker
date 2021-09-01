import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dota2checker/models/opendota/player_peer_entity.dart';
import 'package:dota2checker/models/opendota/player_info_entity.dart';
import 'package:dota2checker/models/opendota/player_recent_match.dart';
import 'package:dota2checker/services/opendota/player_info_service.dart';
import 'package:dota2checker/models/opendota/player_statistic.dart';
import 'package:dota2checker/models/opendota/player_heroes.dart';
import 'package:dota2checker/utils/safe_cb.dart';

import 'units/player_info_heroes_widget.dart';
import 'units/player_info_matches_widget.dart';
import 'units/player_info_peers_widget.dart';
import 'units/player_info_profile_widget.dart';

class PlayerInfoWidget extends StatefulWidget {
  final PlayerInfoService playerInfoService = PlayerInfoService();
  final int playerId;
  final bool isTurbo;

  PlayerInfoWidget({Key? key, required this.playerId, required this.isTurbo})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayerInfoWidgetState();
}

class _PlayerInfoWidgetState extends State<PlayerInfoWidget> {
  late PlayerInfo? _playerInfo;
  late PlayerStatistic? _playerStatistic;
  late List<PlayerPeer>? _playerPeers;
  late List<PlayerHeroes>? _playerHeroes;
  late List<PlayerRecentMatch>? _recentMatches;
  bool _isLoadingInfo = true;
  bool _isLoadingError = false;

  @override
  void initState() {
    _getPlayerInfo();

    super.initState();
  }

  Future<void> _getPlayerInfo() async {
    try {
      setState(() {
        _isLoadingError = false;
        _isLoadingInfo = true;
      });

      final pIS = widget.playerInfoService;

      final playerInfo = await pIS.getPlayerInfo(id: widget.playerId);
      final playerPeers = await pIS.getPlayerPeers(
          id: widget.playerId, isTurbo: widget.isTurbo);
      final recentMatches = await pIS.getRecentMatches(
          id: widget.playerId, isTurbo: widget.isTurbo);
      final playerStatistic = await pIS.getGameStatistic(
          id: widget.playerId, isTurbo: widget.isTurbo);
      final playerHeroes = await pIS.getPlayerHeroes(
          id: widget.playerId, isTurbo: widget.isTurbo);

      if (!mounted) return;

      setState(() {
        _playerInfo = playerInfo;
        _playerPeers = playerPeers;
        _recentMatches = recentMatches;
        _playerStatistic = playerStatistic;
        _playerHeroes = playerHeroes;
        _isLoadingInfo = false;
      });
    } catch (e) {
      print('err: $e');
      if (!mounted) return;

      setState(() {
        _isLoadingError = true;
        _isLoadingInfo = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoadingInfo) {
      return const SizedBox(
          width: 310,
          child: Card(child: Center(child: CircularProgressIndicator())));
    }

    if (_isLoadingError) {
      return SizedBox(
          width: 310,
          child:
              Card(child: Center(child: Text('(error ${widget.playerId})'))));
    }

    return SizedBox(
      width: 310,
      child: Card(
          child: InkWell(
              enableFeedback: false,
              onTap: safeCb(_playerInfo?.profile, () {
                Get.toNamed("/player/${widget.playerId}");
              }),
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _playerInfo!.profile != null
                      ? Column(
                          children: [
                            PlayerInfoProfileWidget(
                                rank: _playerInfo?.rankTier,
                                profile: _playerInfo!.profile!,
                                statistic: _playerStatistic!),
                            PlayerInfoHeroesWidget(heroes: _playerHeroes!),
                            PlayerInfoMatchesWidget(matches: _recentMatches),
                            PlayerInfoPeersWidget(peers: _playerPeers)
                          ],
                        )
                      : const Center(
                          child: Text('Пользователь скрыл профиль'),
                        )))),
    );
  }
}
