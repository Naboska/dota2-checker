import 'dota_dictionary_abilities.dart';
import 'dota_dictionary_hero.dart';
import 'dota_dictionary_item.dart';

class DotaDictionary {
  late Map<String, DotaDictionaryItem> items;
  late Map<String, DotaDictionaryHero> heroes;
  late Map<String, DotaDictionaryAbilities> abilities;
  late String path;

  DotaDictionary({required Map<String, dynamic> items, required Map<String, dynamic> heroes, required Map<String, dynamic> abilities, required this.path}) {
    this.items = _createDictionary<DotaDictionaryItem>(items, (value) => DotaDictionaryItem.fromJson(value));
    this.heroes = _createDictionary<DotaDictionaryHero>(heroes, (value) => DotaDictionaryHero.fromJson(value));
    this.abilities = _createDictionary<DotaDictionaryAbilities>(abilities, (value) => DotaDictionaryAbilities.fromJson(value));
  }

  _createDictionary<Generic>(Map<String, dynamic> dict, Generic Function (dynamic value) mapper) {
    final Map<String, Generic> _dict = {};
    dict.forEach((key, value) {
      _dict[key] = mapper(value);
    });
    return _dict;
  }
}
