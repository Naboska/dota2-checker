import 'package:flutter/material.dart';

import 'package:dota2checker/models/opendota/player_info_entity.dart';

class PlayerInfoProfileWidget extends StatelessWidget {
  final PlayerInfoProfile profile;

  const PlayerInfoProfileWidget({Key? key, required this.profile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
                backgroundImage: NetworkImage(profile.avatarfull)),
          ),
          Text(profile.personaname)
        ],
      ),
    );
  }
}
