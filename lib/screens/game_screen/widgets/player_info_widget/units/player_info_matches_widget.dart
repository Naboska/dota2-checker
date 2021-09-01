import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dota2checker/models/opendota/player_recent_match.dart';
import 'package:dota2checker/models/opendota/dota_heroes.dart';
import 'package:dota2checker/controllers/opendota/dota_heroes_controller.dart';
import 'package:dota2checker/utils/list_find.dart';
import 'package:dota2checker/constants/url.dart';

const int radiantMaxSlot = 127;

class PlayerInfoMatchesWidget extends StatelessWidget {
  final List<PlayerRecentMatch>? matches;

  const PlayerInfoMatchesWidget({Key? key, required this.matches})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<PlayerRecentMatch> _matches = matches ?? [];

    return Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Column(children: [
          const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Последние игры:',
                      style: TextStyle(fontWeight: FontWeight.w600)))),
          SizedBox(
              height: 125,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, i) {
                    final PlayerRecentMatch match = _matches[i];

                    final bool isPlayedRadiant =
                        match.playerSlot < radiantMaxSlot;
                    final bool isWin = isPlayedRadiant ? match.radiantWin : !match.radiantWin;

                    if (match.heroId == 0) return Container();

                    return SizedBox(
                        height: 25,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                GetBuilder<DotaHeroesController>(
                                  builder: (_c) {
                                    DotaHeroes? currHero = listFind<DotaHeroes>(
                                        _c.heroes,
                                        (hero) => hero.id == match.heroId);

                                    String name = currHero!.localizedName;
                                    String npcName = currHero.name.replaceFirst('npc_dota_hero_', '');

                                    return Row(children: [
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: Image(
                                            image: NetworkImage('$heroImgUrl${npcName}.png'),
                                            width: 25,
                                            height: 25,
                                          )),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(right: 14),
                                          child: Text(name,
                                              style: TextStyle(
                                                  color: isWin
                                                      ? Colors.green
                                                      : Colors.red)))
                                    ]);
                                  },
                                ),
                              Row(children: [
                                Text('${match.kills}',
                                    style: const TextStyle(
                                        color: Colors.greenAccent)),
                                const Text('/'),
                                Text('${match.deaths}',
                                    style: const TextStyle(
                                        color: Colors.redAccent)),
                                const Text('/'),
                                Text('${match.assists}',
                                    style: const TextStyle(
                                        color: Colors.amberAccent))
                              ])
                            ]));
                  },
                  itemCount: _matches.isNotEmpty && _matches.length > 5
                      ? 5
                      : _matches.length))
        ]));
  }
}
