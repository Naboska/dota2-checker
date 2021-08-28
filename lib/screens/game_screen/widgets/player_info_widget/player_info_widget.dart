import 'package:dota2checker/models/opendota/player_peer_entity.dart';
import 'package:dota2checker/screens/game_screen/widgets/player_info_widget/units/player_info_peers_widget.dart';
import 'package:flutter/material.dart';

import '../../../../services/opendota/player_info_service.dart';
import '../../../../models/opendota/player_info_entity.dart';
import '../../../../models/opendota/player_peer_entity.dart';

class PlayerInfoWidget extends StatefulWidget {
  final PlayerInfoService playerInfoService = PlayerInfoService();
  final int playerId;

  PlayerInfoWidget({Key? key, required this.playerId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayerInfoWidgetState();
}

class _PlayerInfoWidgetState extends State<PlayerInfoWidget> {
  late PlayerInfo? _playerInfo;
  late List<PlayerPeer>? _playerPeers;
  bool _isLoadingInfo = true;
  bool _isLoadingError = false;

  Future<void> _getPlayerInfo() async {
    try {
      setState(() {
        _isLoadingError = false;
        _isLoadingInfo = true;
      });

      final PlayerInfo playerInfo =
          await widget.playerInfoService.getPlayerInfo(id: widget.playerId);
      final playerPeers =
          await widget.playerInfoService.getPlayerPeers(id: widget.playerId);

      if (!mounted) return;

      setState(() {
        _playerInfo = playerInfo;
        _playerPeers = playerPeers;
        _isLoadingInfo = false;
      });
    } catch (e) {
      print(e);
      if (!mounted) return;

      setState(() {
        _isLoadingError = true;
        _isLoadingInfo = false;
      });
    }
  }

  @override
  void initState() {
    _getPlayerInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoadingInfo) {
      return const SizedBox(
          width: 240,
          height: 700,
          child: Card(child: Center(child: CircularProgressIndicator())));
    }

    if (_isLoadingError) return Text('(error ${widget.playerId})');

    return SizedBox(
      width: 270,
      child: Card(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: _playerInfo!.profile != null
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        _playerInfo!.profile!.avatarfull)),
                              ),
                              Text(_playerInfo!.profile!.personaname)
                            ],
                          ),
                        ),
                        PlayerInfoPeersWidget(peers: _playerPeers)
                      ],
                    )
                  : const Center(
                      child: Text('Пользователь скрыл профиль'),
                    ))),
    );
  }
}
