import 'gsi_buildings.dart';
import 'gsi_hero.dart';
import 'gsi_map.dart';
import 'gsi_player.dart';
import 'gsi_provider.dart';

export 'gsi_buildings.dart';
export 'gsi_hero.dart';
export 'gsi_map.dart';
export 'gsi_player.dart';
export 'gsi_provider.dart';

class GSIModel {
  late GSIBuildings? buildings;
  late GSIProvider provider;
  late GSIMap? map;
  late GSIPlayer? player;
  late GSIHero? hero;
  late dynamic abilities;
  late dynamic items;
  late dynamic draft;
  late dynamic wearables;

  GSIModel.fromJson(Map<String, dynamic> json) {
    var jsonBuildings = json['buildings'];
    var jsonMap = json['map'];
    var jsonHero = json['hero'];

    buildings = jsonBuildings != null ? GSIBuildings.fromJson(jsonBuildings) : null;
    provider = GSIProvider.fromJson(json['provider']);
    map = jsonMap != null ? GSIMap.fromJson(jsonMap) : null;
    player = json['player']['steamid'] != null ? GSIPlayer.fromJson(json['player']) : null;
    hero = jsonHero != null ? GSIHero.fromJson(jsonHero) : null;
  }
}
