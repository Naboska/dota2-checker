import 'package:flutter/material.dart';

import '../../utils/dota_directory.dart';
import '../game_screen/game_screen.dart';
import '../settings_screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  final _dotaDirectory = DotaDirectory();

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDotaPathSelected = false;
  bool _isInitialize = false;

  Future<void> _initializeApp() async {
    setState(() => _isInitialize = false);

    final dir = await widget._dotaDirectory.getDotaDirectory();

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
