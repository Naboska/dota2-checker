import 'package:flutter/material.dart';

import 'package:dota2checker/models/game-state-integrator/game_state_integrator.dart';
import 'package:dota2checker/widgets/situation_widget/situation_widget.dart';
import 'package:dota2checker/widgets/gsi_consumer/gsi_consumer.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

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
    return GSIConsumer(builder: (context, value, child) {
      final GameStateIntegrator? gsi = value.data;
      final bool isGameStart = gsi != null && (gsi.hero?.id ?? -1) > 0;

      return SituationWidget(child: () {

        return Column(children: [
        Query(
          options: QueryOptions(
            document: gql(test),
            operationName: 'GetHeroPositions',
            variables: {
              'heroId': 19
            },
            pollInterval: null
          ),
          builder: (QueryResult result, { Future<QueryResult> Function(FetchMoreOptions)? fetchMore, Future<QueryResult?> Function()? refetch }) {
            // print(result.data);

            if (result.hasException) {
              return Text(result.exception.toString());
            }

            if (result.isLoading) {
              return Text('Loading');
            }

            return Container();
          },
        ),
            HeroBackgroundWidget()
        ]);
      }, isRender: true);
    });
  }
}
