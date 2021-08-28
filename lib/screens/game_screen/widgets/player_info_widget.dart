import 'package:flutter/material.dart';

import '../../../services/opendota/player_info_service.dart';
import '../../../models/opendota/player_info_entity.dart';

class PlayerInfoWidget extends StatefulWidget {
  final PlayerInfoService playerInfoService = PlayerInfoService();
  final int playerId;

  PlayerInfoWidget({Key? key, required this.playerId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayerInfoWidgetState();
}

class _PlayerInfoWidgetState extends State<PlayerInfoWidget> {
  late PlayerInfo? _playerInfo;
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

      if (!mounted) return;

      setState(() {
        _playerInfo = playerInfo;
        _isLoadingInfo = false;
      });
    } catch (e) {
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
          width: 100, height: 50, child: CircularProgressIndicator());
    }

    if (_isLoadingError) return Text('(error ${widget.playerId})');

    return SizedBox(
      width: 240,
      height: 400,
      child: Card(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: _playerInfo!.profile != null
                  ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Padding(padding: const EdgeInsets.only(right: 10),
                            child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    _playerInfo!.profile!.avatarfull)),
                            ),
                        Text(_playerInfo!.profile!.personaname)
                      ],
                    ),
                  )
                ],
              )
                  : const Center(
                child: Text('Пользователь скрыл профиль'),
              ))),
    );
  }
}
