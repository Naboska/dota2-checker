import 'dart:async';
import 'package:flutter/material.dart';

import 'package:dota2checker/models/game_state_integrator/game_state_integrator.dart';
import 'package:dota2checker/widgets/situation_widget/situation_widget.dart';
import 'package:dota2checker/widgets/gsi_consumer/gsi_consumer.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'units/game_map_widget/game_map_widget.dart';
import 'units/hero_background_widget.dart';

const String test = """
  query GetHeroPositions(\$heroId: Short!, \$positionIds: [MatchPlayerPositionType], \$bracketBasicIds: [RankBracketHeroTimeDetail]) {
    heroStats {
      position(heroId: \$heroId, positionIds: \$positionIds, bracketBasicIds: \$bracketBasicIds) {
        assists
        matchCount:
          count
          cs
          deaths
          dn
          heroDamage
          kills
          position
          towerDamage
          wins
          __typename
        }
        __typename
      }
    }
""";

class GamePlayerWidget extends StatelessWidget {
  const GamePlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GSIBuildings? prevBuildings;

    return GSIConsumer(builder: (context, value, child) {
      final GSIModel? gsi = value.data;
      final bool isGameStart = gsi != null && gsi.player?.activity == 'playing';

      return SituationWidget(
          isRender: isGameStart,
          child: () {
            final GSIBuildings? buildings = gsi?.buildings;
            Timer.run(() => prevBuildings = gsi?.buildings);

            return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SizedBox(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SituationWidget(
                            child: () => GameMapWidget(
                                buildings: buildings!.radiant!,
                                side: 'radiant',
                                prevBuildings: prevBuildings?.radiant),
                            isRender: buildings?.radiant != null),
                        SituationWidget(
                            child: () => GameMapWidget(
                                buildings: buildings!.dire!,
                                side: 'dire',
                                prevBuildings: prevBuildings?.dire),
                            isRender: buildings?.dire != null),
                        // Query(
                        //   options: QueryOptions(
                        //       document: gql(test),
                        //       operationName: 'GetHeroPositions',
                        //       variables: {'heroId': 19},
                        //       pollInterval: null),
                        //   builder: (QueryResult result,
                        //       {Future<QueryResult> Function(FetchMoreOptions)?
                        //           fetchMore,
                        //       Future<QueryResult?> Function()? refetch}) {
                        //     // print(result.data);
                        //
                        //     if (result.hasException) {
                        //       return Text(result.exception.toString());
                        //     }
                        //
                        //     if (result.isLoading) {
                        //       return Text('Loading');
                        //     }
                        //
                        //     return Container();
                        //   },
                        // ),
                        // HeroBackgroundWidget()
                      ],
                    )));
          });
    });
  }
}
