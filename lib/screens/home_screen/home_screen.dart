import 'package:dota2checker/models/dota_dictionary/dota_dictionary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dota2checker/services/dictionary/dictionary_service.dart';
import 'package:dota2checker/controllers/dota_dictionary/dota_dictionary_controller.dart';
import 'package:dota2checker/utils/dota.dart';

import '../game_screen/game_screen.dart';

class HomeScreen extends StatefulWidget {
  final dictionaryController = Get.put(DotaDictionaryController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isInitialize = false;
  bool _isInitializeError = false;

  @override
  void initState() {
    _initializeApp();

    super.initState();
  }

  _setError(bool isError) {
    setState(() {
      _isInitialize = true;
      _isInitializeError = isError;
    });
  }

  Future<void> _initializeApp() async {
    try {
      final dir = await Dota.getDirectory();
      final isPathEmpty = dir == null;

      if (!isPathEmpty) {
        final itemsDict = await DictionaryService.getItems();
        final heroesDict = await DictionaryService.getHeroes();
        final abilitiesDict = await DictionaryService.getAbilities();

        widget.dictionaryController.change(DotaDictionary(
            items: itemsDict,
            heroes: heroesDict,
            abilities: abilitiesDict,
            path: dir!));
      }

      _setError(isPathEmpty);
    } catch (e) {
      print(e);
      _setError(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialize) return const Center(child: CircularProgressIndicator());

    if (_isInitializeError) {
      return const Scaffold(
          body: Center(child: Text('Произошла ошибка при иниализации')));
    }

    return const GameScreen();
  }
}
