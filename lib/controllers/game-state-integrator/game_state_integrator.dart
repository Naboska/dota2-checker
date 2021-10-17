import 'package:flutter/material.dart';

import 'package:dota2checker/models/game-state-integrator/game_state_integrator.dart';

import './game_state_integrator_server.dart';

class GSIController extends ChangeNotifier {
  GameStateIntegrator? _data;
  final _server = GameStateIntegratorServer();

  GSIController() {
    try {
      _server.subscribe(put);
      _server.listen(port: 32700);
    } catch (e) {
      print(e);
    }
  }

  get data => _data;

  put(Map<String, dynamic> body) {
    _data = GameStateIntegrator.fromJson(body);

    notifyListeners();
  }
}
