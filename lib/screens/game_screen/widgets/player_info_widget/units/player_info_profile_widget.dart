import 'package:flutter/material.dart';

import 'package:dota2checker/models/opendota/player_info_entity.dart';
import 'package:dota2checker/models/opendota/player_statistic.dart';
import 'package:dota2checker/widgets/text_percent_widget/text_percent_widget.dart';

const rankImageUrl =
    'https://www.opendota.com/assets/images/dota2/rank_icons/rank_icon_';
const starImageUrl =
    'https://www.opendota.com/assets/images/dota2/rank_icons/rank_star_';

class PlayerInfoProfileWidget extends StatelessWidget {
  final int? rank;
  final PlayerInfoProfile profile;
  final PlayerStatistic statistic;

  const PlayerInfoProfileWidget(
      {Key? key, required this.profile, required this.statistic, this.rank})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? rankIcon = rank != null ? rank.toString()[0] : '0';
    final String? starIcon = rank != null ? rank.toString()[1] : null;

    return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CircleAvatar(
                    backgroundImage: profile.avatarfull != null ? NetworkImage(profile.avatarfull!) : null),
              ),
              SizedBox(width: 100, child: Text(profile.personaname, overflow: TextOverflow.ellipsis))
            ]),
            Stack(children: [
              Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Stack(children: [
                    Image(
                        width: 30,
                        height: 30,
                        image: NetworkImage('$rankImageUrl$rankIcon.png')),
                    starIcon != null
                        ? Image(
                            width: 30,
                            height: 30,
                            image: NetworkImage('$starImageUrl$starIcon.png'))
                        : Container(),
                  ])),
              Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: TextPercentWidget(percent: statistic.percent))
            ])
          ],
        ));
  }
}
