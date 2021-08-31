import 'package:flutter/material.dart';

import 'package:dota2checker/models/opendota/player_peer_entity.dart';
import 'package:dota2checker/widgets/text_percent_widget/text_percent_widget.dart';

class PlayerInfoPeersWidget extends StatelessWidget {
  final List<PlayerPeer>? peers;

  const PlayerInfoPeersWidget({Key? key, required this.peers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PlayerPeer> _peers = peers ?? [];

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
          height: 75,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, i) {
                final PlayerPeer peer = _peers[i];
                final double percentWin = (peer.win / peer.games * 100);

                return SizedBox(
                    height: 25,
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
                            SizedBox(width: 100, child: Text(peer.personaname, maxLines: 1, overflow: TextOverflow.ellipsis))
                          ]),
                          TextPercentWidget(percent: percentWin),
                        ]));
              },
              itemCount: peersCount != 0 && peersCount > 3 ? 3 : peersCount))
    ]);
  }
}
