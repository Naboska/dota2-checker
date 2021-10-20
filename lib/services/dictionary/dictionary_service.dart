import 'dart:convert';
import 'package:http/http.dart' as http;

class DictionaryService {
  static const String _dictionaryUrl = 'https://raw.githubusercontent.com/odota/dotaconstants/master/build/';
  static const String _staticUrl = 'https://media.steampowered.com';
  static const String _soundUrl = 'https://github.com/Naboska/dota2-checker/raw/master/assets/music';

  static getItems() => _getRequest('items.json');
  static getHeroes() => _getRequest('heroes.json');
  static getAbilities() => _getRequest('abilities.json');

  static createStatic(String image) {
    return '$_staticUrl$image';
  }

  static createSound(String sound) {
    return '$_soundUrl$sound';
  }

  static _getRequest(String href) async {
    final response = await http.get(Uri.parse('$_dictionaryUrl$href'));

    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 404:
        throw Exception('Ошибка получения 404');
      default:
        throw Exception('Ошибка получения.');
    }
  }
}
