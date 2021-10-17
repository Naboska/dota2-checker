import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dota2checker/models/dota_dictionary/dota_dictionary_hero.dart';
import 'package:dota2checker/models/opendota/player_heroes.dart';
import 'package:dota2checker/controllers/dota_dictionary/dota_dictionary_controller.dart';
import 'package:dota2checker/widgets/text_percent_widget/text_percent_widget.dart';
import 'package:dota2checker/services/dictionary/dictionary_service.dart';

class PlayerInfoHeroesWidget extends StatelessWidget {
  final List<PlayerHeroes>? heroes;

  const PlayerInfoHeroesWidget({Key? key, required this.heroes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<PlayerHeroes> filteredHeroes = heroes ?? [];
    final int heroesItems =
        filteredHeroes.length > 3 ? 3 : filteredHeroes.length;

    if (heroesItems == 0) return SizedBox(height: 30, child: Container());

    return Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SizedBox(
            height: 30,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  final PlayerHeroes playerHero = filteredHeroes[i];

                  return GetBuilder<DotaDictionaryController>(
                    builder: (_c) {
                      final DotaDictionaryHero hero = _c.dictionary!.heroes[playerHero.heroId]!;

                      double winRate =
                          (playerHero.win / playerHero.games) * 100;

                      return Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Row(children: [
                            Container(
                                color: Colors.black38,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 5, left: 2, top: 1),
                                    child: Column(children: [
                                      Text('${playerHero.games}',
                                          style: const TextStyle(fontSize: 10)),
                                      TextPercentWidget(
                                        percent: winRate,
                                        fontSize: 10,
                                      )
                                    ]))),
                            Image(
                              image: NetworkImage('${DictionaryService.createStatic(hero.img)}'),
                              height: 40,
                            )
                          ]));
                    },
                  );
                },
                itemCount: heroesItems)));
  }
}
