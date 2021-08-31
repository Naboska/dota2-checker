import 'package:dota2checker/services/opendota/game_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dota2checker/controllers/opendota/dota_heroes_controller.dart';
import 'package:dota2checker/utils/dota_directory.dart';

import '../game_screen/game_screen.dart';
import '../settings_screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  final dotaDirectory = DotaDirectory();
  final heroesController = Get.put(DotaHeroesController());
  final dotaService = GameService();

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDotaPathSelected = false;
  bool _isInitialize = false;
  bool _isInitializeError = false;

  Future<void> _initializeApp() async {
    try {
      setState(() {
        _isInitializeError = false;
        _isInitialize = false;
      });

      final dir = await widget.dotaDirectory.getDotaDirectory();
      final heroes = await widget.dotaService.getHeroes();

      widget.heroesController.change(heroes);

      setState(() {
        _isInitialize = true;
        _isDotaPathSelected = dir != null ? true : false;
      });
    } catch (e) {
      setState(() => _isInitializeError = true);
    }
  }

  @override
  void initState() {
    _initializeApp();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_isInitializeError) {
      return Scaffold(
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            const Padding(
                padding: EdgeInsets.only(bottom: 14),
                child: Text('Произошла ошибка при иниализации')),
            ElevatedButton(
                onPressed: _initializeApp,
                child: const Text('Попробовать еще раз'))
          ])));
    }

    if (!_isInitialize) return const Center(child: CircularProgressIndicator());

    return _isDotaPathSelected
        ? GameScreen()
        : SettingsScreen(reInitialize: _initializeApp);
  }
}
