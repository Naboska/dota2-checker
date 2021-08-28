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

  Future<void> _initializeApp() async {
    setState(() => _isInitialize = false);

    final dir = await widget.dotaDirectory.getDotaDirectory();
    final heroes = await widget.dotaService.getHeroes();

    widget.heroesController.change(heroes);

    setState(() {
      _isInitialize = true;
      _isDotaPathSelected = dir != null ? true : false;
    });
  }

  @override
  void initState() {
    _initializeApp();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialize) return const Center(child: CircularProgressIndicator());

    return _isDotaPathSelected ? GameScreen() : SettingsScreen(reInitialize: _initializeApp);
  }
}
