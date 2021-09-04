import 'dart:io';

class GameIntegratorServer {
  void serverStart() async {
    try {
      final _server = await HttpServer.bind('127.0.0.1', 8080);
      
    } catch (e) {
      print(e);
    }
  }
}