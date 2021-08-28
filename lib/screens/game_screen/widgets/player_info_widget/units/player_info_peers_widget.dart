import 'package:flutter/material.dart';

import '../../../../../models/opendota/player_peer_entity.dart';

class PlayerInfoPeersWidget extends StatelessWidget {
  late List<PlayerPeer> _peers = [];

  PlayerInfoPeersWidget({Key? key, List<PlayerPeer>? peers}) : super(key: key) {
    if (peers != null) {
      _peers = peers;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_peers.isEmpty) return Container();

    final int peersCount = _peers.length;

    return Column(children: [
      const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Статистика с другими игроками:',
                  style: TextStyle(fontWeight: FontWeight.w600)))),
      SizedBox(
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, i) {
                final PlayerPeer peer = _peers[i];
                final int percentWin = (peer.win / peer.games * 100).toInt();

                return SizedBox(
                    height: 25,
                    width: double.infinity,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: CircleAvatar(
                                radius: 10,
                                backgroundImage:
                                    NetworkImage(peer.avatarfull))),
                            Text(peer.personaname)
                          ]),
                          Text('$percentWin%', style: TextStyle(color: HSLColor.fromAHSL(1, percentWin.toDouble(), 1.0, 0.4).toColor()))
                        ]));
              },
              itemCount: peersCount != 0 && peersCount > 5 ? 5 : peersCount))
    ]);
  }
}
